SHELL := /bin/bash

.PHONY: init deps lint run test docker_build

init:
	python3 -m venv .venv
deps:
	pip install -r requirements.txt
	pip install -r test_requirements.txt
lint:
	flake8 hello_world test
run:
	python3 main.py
test:
	PYTHONPATH=. pytest --verbose -s
docker_build:
	docker build -t hello-world-printer:latest .
