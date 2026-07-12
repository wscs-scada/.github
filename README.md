# .github

Shared, reusable GitHub Actions workflows for the WSCS SCADA organization, plus
the org profile (`profile/README.md`).

## How it works

`.github/workflows/` holds reusable workflows (`on: workflow_call`) that each
service repository invokes from its own `.github/workflows/ci.yml`. This keeps CI
logic defined once and consumed everywhere.

## Project layout

| Path                                 | Responsibility                                |
| ------------------------------------ | --------------------------------------------- |
| `.github/workflows/pre-commit.yml`   | Run the pre-commit hooks in CI.               |
| `.github/workflows/python-check.yml` | `uv sync` + `make check` for Python repos.    |
| `.github/workflows/go-check.yml`     | Install gofumpt/staticcheck + `make check`.   |
| `.github/workflows/ts-check.yml`     | `npm ci` + `make check` for TypeScript repos. |
| `.github/workflows/gitops-check.yml` | `make check` for the IaC repo.                |
| `profile/README.md`                  | Organization profile page.                    |

## Installation

```sh
make install
```

## Running / Usage

This repository has no runtime; its workflows are consumed by other repos.

## Configuration

None; workflows are self-contained.

## Common tasks

| Target              | Description                             |
| ------------------- | --------------------------------------- |
| `make lint`         | `yamllint`.                             |
| `make format-check` | `prettier --check`.                     |
| `make test`         | Strict `yamllint`.                      |
| `make check`        | lint + format-check + typecheck + test. |

## Development

Run `make check` before pushing.
