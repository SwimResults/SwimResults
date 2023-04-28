# SwimResults

## Project Structure

### Frontend and Webpages

[WebApplication](https://github.com/SwimResults/WebApplication) ![](https://img.shields.io/github/actions/workflow/status/swimresults/WebApplication/node.js.yml?label=Action&logo=github&style=flat-square)

[StatusPage](https://github.com/SwimResults/StatusPage) ![](https://img.shields.io/github/actions/workflow/status/swimresults/StatusPage/main.yml?label=Action&logo=github&style=flat-square)

### Backend (Microservices)

[athlete-service](https://github.com/SwimResults/athlete-service) ![](https://img.shields.io/github/actions/workflow/status/swimresults/athlete-service/go.yml?label=Action&logo=github&style=flat-square)

[start-service](https://github.com/SwimResults/start-service) ![](https://img.shields.io/github/actions/workflow/status/swimresults/start-service/go.yml?label=Action&logo=github&style=flat-square)

### Diagram

```mermaid
flowchart TD
    A[fa:fa-server Microservices]
    A --> O[athlete-service]
    A --> P[start-service]
    A --> Q[import-service]
    A --> R[meeting-service]
    A --> S[user-service]
    B[fa:fa-link Frontend]
    B --> H[Angular SPA]
    B --> I[IOS App]
```
