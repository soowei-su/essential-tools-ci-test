.DEFAULT_GOAL := help

help:
	@echo "make setup | run | test | lint | clean | deploy"

.PHONY: help setup run test lint clean deploy

setup: .venv/bin/activate
.venv/bin/activate: requirements.txt
	python3 -m venv .venv
	./.venv/bin/pip install -r requirements.txt

run: setup
	./.venv/bin/python3 app.py

test: setup
	./.venv/bin/python3 -m pytest -q

lint:
	shellcheck bin/*

clean:
	rm -rf .venv __pycache__

# Assignment 9 shape: run the update over the "box" SSH alias. In this test
# the box is a stand-in SSH server started inside the CI job.
deploy:
	ssh box 'echo "deployed $$(date -u +%FT%TZ)" >> deploy.log && tail -n 1 deploy.log && hostname'
