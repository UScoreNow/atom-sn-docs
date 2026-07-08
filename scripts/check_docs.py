#!/usr/bin/env python3
"""Consistency checks for atom-sn-docs (see CONSTRAINTS.md).

1. tokens/tokens.json is valid JSON and contains no pure #000000/#FFFFFF.
2. Retired brand names (Newsprint, Night Press) appear nowhere.
3. Every *-es.md doc has its *-en.md pair and vice versa.
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
errors = []

# 1. tokens.json
tokens_path = ROOT / "tokens" / "tokens.json"
try:
    raw = tokens_path.read_text(encoding="utf-8")
    json.loads(raw)
except (OSError, ValueError) as e:
    errors.append(f"tokens/tokens.json invalid: {e}")
    raw = ""
for forbidden in re.findall(r"#(?:000000|FFFFFF)\b", raw, flags=re.IGNORECASE):
    # allowed only inside the $meta.rules.forbidden declaration
    pass
hexes = re.findall(r'"\$value"\s*:\s*"(#[0-9A-Fa-f]{6})"', raw)
for h in hexes:
    if h.upper() in ("#000000", "#FFFFFF"):
        errors.append(f"forbidden pure color in tokens.json: {h}")

# 2. retired brand names
BANNED = re.compile(r"newsprint|night\s*press", re.IGNORECASE)
for path in ROOT.rglob("*"):
    if path.is_dir() or path.is_symlink() or ".git" in path.parts:
        continue
    if path.suffix in (".ttf", ".svg"):
        continue
    # CONSTRAINTS.md must name the banned terms; the checker itself defines them
    if path.name in ("check_docs.py", "CONSTRAINTS.md"):
        continue
    try:
        text = path.read_text(encoding="utf-8")
    except (UnicodeDecodeError, OSError):
        continue
    for m in BANNED.finditer(text):
        errors.append(f"retired brand name '{m.group(0)}' in {path.relative_to(ROOT)}")

# 3. es/en pairing
for md in ROOT.rglob("*-es.md"):
    if ".git" in md.parts:
        continue
    pair = md.with_name(md.name.replace("-es.md", "-en.md"))
    if not pair.exists():
        errors.append(f"missing English pair for {md.relative_to(ROOT)}")
for md in ROOT.rglob("*-en.md"):
    if ".git" in md.parts:
        continue
    pair = md.with_name(md.name.replace("-en.md", "-es.md"))
    if not pair.exists():
        errors.append(f"missing Spanish pair for {md.relative_to(ROOT)}")

if errors:
    print("check_docs FAILED:")
    for e in errors:
        print(f"  - {e}")
    sys.exit(1)
print(f"check_docs OK ({len(hexes)} token colors, es/en pairs consistent)")
