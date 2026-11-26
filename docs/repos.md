# Repository cheat sheet

All repos: `github.com/SwimResults/<name>`, default branch `master`, `develop` deploys to the dev environment.
Paths are relative to the workspace root.

## Backend (`server/`, Go 1.24, Gin, MongoDB)

Common to all services:

- Build: `CGO_ENABLED=0 go build -o . ./...` · Test: `go test ./...`
- Run locally: `docker compose -f dev/docker-compose.yml up --build <svc>` (or set the `SR_<SVC>_*` env vars and `go run .`)
- CI: `.github/workflows/go.yml` — build, test, push `ghcr.io/swimresults/<repo>:<branch|tag>` (push and PR on master/develop)
- The prod `Dockerfile` copies a binary that CI builds; it doesn't compile.
- Layout: `controller/` (routes) · `service/` (logic + Mongo) · `model/` (entities) · `dto/` (requests) · `client/` (exported Go client for other services)

| Repo | Purpose | Exported client | Calls | Tests |
|---|---|---|---|---|
| `server/service-core` | shared lib: `security` (auth middleware, permissions), `client` (HTTP), `misc` | – | – | Aliasify only, **no CI** |
| `server/meeting-service` | meetings, events, files, incidents, styles, locations | `MeetingClient`, `EventClient`, `AgeGroupClient` | – | 1 unit test |
| `server/athlete-service` | athletes, teams, certificates | `AthleteClient`, `TeamClient` | – | none (commented out) |
| `server/start-service` | starts, heats, results, rankings, registrations, livestream; heat notifications | `StartClient`, `HeatClient`, `DisqualificationClient`, `RankingClient` | athlete, meeting, user | 3 unit tests |
| `server/user-service` | users, follows, dashboards, reports, devices; APNs/FCM push | `NotificationClient` | meeting, athlete | none |
| `server/import-service` | DSV/Lenex/PDF import, EasyWK/ALGE live timing, certificates, SSE progress | – | meeting, athlete, start, OpenAI | ~17, fixtures in `assets/` |
| `server/admin-service` | template only (Example CRUD) | – | – | none |

Extra env vars: import-service `SR_IMPORT_OPENAI_KEY`, `SR_NO_IMPORT`, `config/live_meeting.json`;
user-service `SR_APNS_URL`, `config/apns/*`, `config/fcm/private_key.json`.

## Clients (`client/`)

| Repo | Stack | Build / run / test | Models & API client | Auth | CI |
|---|---|---|---|---|---|
| `client/WebApplication` | Angular 20, Material, ngx-translate | `npm start` · `npm run build:master\|build:develop` · `npm run test:test` · `npm run lint` | `src/app/core/model/**`, `src/app/core/service/api/**` (hand-written); base URLs in `src/environments/` | angular-oauth2-oidc PKCE | node.js.yml → ghcr image (nginx) |
| `client/iosApplication` | SwiftUI, iOS 16.4+, AppAuth, WidgetKit/ActivityKit | `xcodebuild -scheme SwimResults -project SwimResults.xcodeproj -destination 'platform=iOS Simulator,name=…' test` | `SwimResults/Code/Features/**/Models`, `Code/Utilities/{ApiActions,Services}.swift` | AppAuth PKCE, Keychain | ios.yml (build + test) |
| `client/AndroidApplication` | Kotlin, Compose, Retrofit/Gson, AppAuth, FCM | Android Studio (Gradle wrapper scripts missing) · `assembleDebug`, `test` | `app/src/main/java/de/swimresults/swimresults/data/{network,model}` | AppAuth PKCE | none |
| `client/ManagerApplication` | Electron 35 + Angular 20 | `npm run build` then `npm start` · `npm run make-win32` | `src/app/core/{model,service}` (ALGE only) | none (meeting password) | build.yml → Windows release on `v*` tags |
| `client/Homepage` | PHP 8.5 / Apache, MySQL | `docker compose up` (port 4300) | `src/php/helper/client_*.php` (assoc arrays) | none | main.yml → ghcr image |
| `client/DownloadPage` | PHP 8.5 / Apache | `docker build .` | inline in `src/index.php` | none | main.yml → ghcr image |
| `client/Livestreaming` | static HTML/jQuery (OBS overlays) | open `src/stream-ui/index.html` | `src/stream-ui/js/{api,models}.js` | none | GitHub Pages, no CI |

## Other org repos (not cloned here)

`keycloak` (Keycloak image with themes + Apple IdP provider), `StatusPage`, `StreamInterface` (C#), `OfflinePage`,
`joomla-modules`, `example-service`, `.github` (org profile). Archived: `example-service-java`, `status-page`.
`HelperApplication` is superseded by `ManagerApplication`.
