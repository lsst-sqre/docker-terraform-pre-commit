all: build

build:
	docker build -t docker.io/lsstsqre/terraform-pre-commit:latest .
