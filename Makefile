# atom-sn-docs — docs-only repo. `make check` is the consistency predicate.

.PHONY: setup test lint check

setup:
	@echo "Docs-only repo: nothing to install."

lint:
	@python3 scripts/check_docs.py

test: lint

check: lint
	@echo "check OK"
