# SwimResults workspace — guide for agents and contributors

This folder is the **meta repo** `SwimResults/SwimResults`. Every project lives in its **own git repo** in a
subfolder; those folders are gitignored here. Always run git commands inside the repo you're changing.

```
./                        SwimResults/SwimResults (this repo, public): docs, local dev stack, workspace scripts
├── server/<svc>-service  Go microservices (meeting, athlete, start, user, import, admin)
├── server/service-core   shared Go library (auth middleware, HTTP client)
├── client/<App>          WebApplication, iosApplication, AndroidApplication, ManagerApplication,
│                         Homepage, DownloadPage, Livestreaming
├── swimresults-api/      SwimResults/swimresults-api: OpenAPI specs + generated clients (Go, npm, SwiftPM, Maven)
├── swimresults-angular/  SwimResults/swimresults-angular: @swimresults/angular, API layer shared by the Angular apps
└── infrastructure/       SwimResults/infrastructure (PRIVATE): Docker Swarm stacks, deploy scripts
```

Set up: `scripts/ws.sh clone` · update all: `scripts/ws.sh pull` · overview: `scripts/ws.sh status`.

## Where to look

- Architecture, call graph, auth, data: [docs/architecture.md](docs/architecture.md)
- Per-repo build/run/test commands and code layout: [docs/repos.md](docs/repos.md)
- Run the backend locally: [dev/docker-compose.yml](dev/docker-compose.yml) → gateway on `http://localhost:8090/<svc>/v1/`
- Production/dev deployment: `infrastructure/README.md` (private)

## Rules

- **Secrets never go into any repo** — not this one, not service repos, not the private infrastructure repo.
  Use `.env` files (gitignored) and commit `*.env.example` with empty values.
- **Commits** use the repository owner's own git identity. Do not add AI co-author/attribution trailers.
- Branches: `master` = production, `develop` = dev environment. CI pushes images on both.
- API changes affect many consumers (see the "Who calls whom" tables). When changing a route or a model field,
  check every consumer listed there — including the implicit ones (Homepage, Livestreaming, DownloadPage).
- **API contracts** live in `swimresults-api/specs/<svc>.yaml` and are the source of truth. When you add, remove
  or re-permission a route in a service, update its spec too; `make check` in `swimresults-api` (and its CI,
  daily against each service's `master`) fails on route/permission drift.
- Go service-to-service clients live in the **target** service's `client/` package and are consumed by version
  tag; bump and tag the target, then update the consumers' `go.mod`.
- Cross-repo changes: change and tag the provider first, then consumers, one repo/PR at a time.
