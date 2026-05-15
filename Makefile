# Makefile for meshcore-bot
# Usage:
#   make install   — install runtime + optional dependencies into a uv-managed venv
#   make dev       — install everything needed for development (tests, lint)
#   make test      — run pytest with coverage
#   make lint      — run ruff check + mypy
#   make fix       — auto-fix ruff lint errors
#   make deb       — build a .deb package (requires fakeroot + dpkg-deb)
#   make config    — launch the interactive ncurses config editor
#   make clean     — remove venv and build artefacts

PYTHON  ?= python3
VENV    := .venv
UV      ?= uv

.PHONY: all install dev test test-no-cov lint fix deb config clean

all: dev

# ---------------------------------------------------------------------------
# Environment setup
# ---------------------------------------------------------------------------

install:
	$(UV) sync --extra profanity --extra geo

dev:
	$(UV) sync --extra profanity --extra geo --extra test --group lint

# ---------------------------------------------------------------------------
# Testing
# ---------------------------------------------------------------------------

test:
	$(UV) run pytest tests/ -v --tb=short

# Run tests without the coverage threshold (useful during initial development)
test-no-cov:
	$(UV) run pytest tests/ -v --tb=short --no-cov

# ---------------------------------------------------------------------------
# Linting
# ---------------------------------------------------------------------------

lint:
	$(UV) run ruff check modules/ tests/
	$(UV) run mypy modules/

fix:
	$(UV) run ruff check --fix modules/ tests/

# ---------------------------------------------------------------------------
# Packaging
# ---------------------------------------------------------------------------

# Build a .deb package.  Pass VERSION= to override the version from pyproject.toml.
# Requires: fakeroot, dpkg-deb  (sudo apt install fakeroot)
deb:
	bash scripts/build-deb.sh $(VERSION)

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------

# Launch the interactive ncurses config editor.
# Pass CONFIG= to open a specific config file (default: config.ini).
config:
	$(UV) run python scripts/config_tui.py $(CONFIG)

# ---------------------------------------------------------------------------
# Housekeeping
# ---------------------------------------------------------------------------

clean:
	rm -rf $(VENV) build dist/*.egg-info .mypy_cache .ruff_cache __pycache__ .pytest_cache
	rm -rf dist/deb-build
