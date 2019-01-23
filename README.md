docker-terraform-pre-commit
===

[![Build Status](https://travis-ci.org/lsst-sqre/docker-terraform-pre-commit.png)](https://travis-ci.org/lsst-sqre/docker-terraform-pre-commit)

`Dockerfile` build for `lsstsqre/terraform-pre-commit` docker image. Intended
for testing `terraform` related git `pre-commit` hooks under CI.

Provides
---

* `pre-commit` pypi package
* `terraform` binary
* `terraform-docs` binary

See Also
---

* [`terraform`](https://www.terraform.io/)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs)
* [`pre-commit`](https://github.com/pre-commit/pre-commit)
* [`pre-commit-terraform`](https://github.com/antonbabenko/pre-commit-terraform)
