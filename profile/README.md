# WSCS SCADA

Water Supply Control System — an event-driven SCADA platform and Digital Twin
for agricultural water infrastructure. Services communicate over MQTT, Redis,
and Temporal.io across a polyglot (Go, Python, TypeScript) polyrepo.

## Repositories

| Repo                 | Stack              | Role                                                  |
| -------------------- | ------------------ | ----------------------------------------------------- |
| `wscs-api`           | Python / FastAPI   | Spatial device registry, pipe AST engine, WebSockets. |
| `wscs-worker`        | Python / Temporal  | Stateful irrigation and FSM workflows.                |
| `wscs-safety-agents` | Python             | Edge hardware-protection limits.                      |
| `wscs-can-bridge`    | Go                 | SocketCAN-to-MQTT protocol bridge.                    |
| `wscs-notify`        | Go                 | Outbound push-notification gateway.                   |
| `wscs-ui`            | TypeScript / Vue 3 | Map-first Digital Twin SPA.                           |
| `wscs-gitops`        | IaC                | docker-compose and FluxCD manifests.                  |

## Shared CI

Reusable workflows live in `.github/workflows/` and are invoked by each service
via `uses: wscs-scada/.github/.github/workflows/<name>.yml@main`.
