# SwimResults

## Project Structure

<table>
    <thead>
        <tr>
            <th>System</th>
            <th>Description</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan=4><b>Frontend and Webpages</b></td>
        </tr>
        <tr>
            <td>WebApplication</td>
            <td>🔗 <a href="https://github.com/SwimResults/WebApplication">Link</a></td>
            <td>🟡</td>
            <td><img src="https://img.shields.io/github/actions/workflow/status/swimresults/WebApplication/node.js.yml?label=Action&logo=github&style=flat-square"></td>
        </tr>
        <tr>
            <td>StatusPage</td>
            <td>🔗 <a href="https://github.com/SwimResults/StatusPage">Link</a></td>
            <td>🟡</td>
            <td><img src="https://img.shields.io/github/actions/workflow/status/swimresults/StatusPage/main.yml?label=Action&logo=github&style=flat-square"></td>
        </tr>
        <tr>
            <td colspan=4><b>Backend (Microservices)</b></td>
        </tr>
        <tr>
            <td>athlete-service</td>
            <td>🔗 <a href="https://github.com/SwimResults/athlete-service">Link</a></td>
            <td>🟡</td>
            <td><img src="https://img.shields.io/github/actions/workflow/status/swimresults/athlete-service/go.yml?label=Action&logo=github&style=flat-square"></td>
        </tr>
        <tr>
            <td>start-service</td>
            <td>🔗 <a href="https://github.com/SwimResults/start-service">Link</a></td>
            <td>🟡</td>
            <td><img src="https://img.shields.io/github/actions/workflow/status/swimresults/start-service/go.yml?label=Action&logo=github&style=flat-square"></td>
        </tr>
        <tr>
            <td>user-service</td>
            <td>🔗 <a href="https://github.com/SwimResults/user-service">Link</a></td>
            <td>🔴</td>
            <td><img src="https://img.shields.io/github/actions/workflow/status/swimresults/user-service/go.yml?label=Action&logo=github&style=flat-square"></td>
        </tr>
        <tr>
            <td>import-service</td>
            <td>🔗 <a href="https://github.com/SwimResults/import-service">Link</a></td>
            <td>🔴</td>
            <td><img src="https://img.shields.io/github/actions/workflow/status/swimresults/import-service/go.yml?label=Action&logo=github&style=flat-square"></td>
        </tr>
        <tr>
            <td>meeting-service</td>
            <td>🔗 <a href="https://github.com/SwimResults/meeting-service">Link</a></td>
            <td>🔴</td>
            <td><img src="https://img.shields.io/github/actions/workflow/status/swimresults/meeting-service/go.yml?label=Action&logo=github&style=flat-square"></td>
        </tr>
    </tbody>
</table>

**Status:**
🟢 Done
🟡 In Development
🔴 Open


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
