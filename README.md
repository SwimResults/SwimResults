# SwimResults

## Project Structure

<table>
    <thead>
        <tr>
            <th>System</th>
            <th>Description</th>
            <th>Progress</th>
            <th>Status</th>
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
            <td>
                <img src="https://img.shields.io/github/actions/workflow/status/swimresults/WebApplication/node.js.yml?label=Action&logo=github&style=flat-square">
                <br>
                <img alt="Website" src="https://img.shields.io/website?style=flat-square&url=https%3A%2F%2Fapp.swimresults.de">
                <br>
                <img src="https://weblate.swimresults.de/widgets/swimresults/-/webapplication/svg-badge.svg" alt="Translation Progress" />
                <!--img alt="Weblate project translated" src="https://img.shields.io/weblate/progress/swimresults?server=https%3A%2F%2Fweblate.swimresults.de&style=flat-square"-->
            </td>
        </tr>
        <tr>
            <td>Homepage</td>
            <td>🔗 <a href="https://github.com/SwimResults/Homepage">Link</a></td>
            <td>🟡</td>
            <td>
                <img src="https://img.shields.io/github/actions/workflow/status/swimresults/Homepage/main.yml?label=Action&logo=github&style=flat-square">
                <br>
                <img alt="Website" src="https://img.shields.io/website?style=flat-square&url=https%3A%2F%2F.swimresults.de">
                <br>
                <img src="https://weblate.swimresults.de/widgets/swimresults/-/homepage/svg-badge.svg" alt="Translation Progress" />
                <!--img alt="Weblate project translated" src="https://img.shields.io/weblate/progress/swimresults?server=https%3A%2F%2Fweblate.swimresults.de&style=flat-square"-->
            </td>
        </tr>
        <tr>
            <td>StatusPage</td>
            <td>🔗 <a href="https://github.com/SwimResults/StatusPage">Link</a></td>
            <td>🟡</td>
            <td>
                <img src="https://img.shields.io/github/actions/workflow/status/swimresults/StatusPage/main.yml?label=Action&logo=github&style=flat-square">
                <br>
                <img alt="Website" src="https://img.shields.io/website?style=flat-square&url=https%3A%2F%2Fstatus.swimresults.de">
            </td>
        </tr>
        <tr>
            <td colspan=4><b>Backend (Microservices)</b></td>
        </tr>
        <tr>
            <td>athlete-service</td>
            <td>🔗 <a href="https://github.com/SwimResults/athlete-service">Link</a></td>
            <td>🟡</td>
            <td>
                <img src="https://img.shields.io/github/actions/workflow/status/swimresults/athlete-service/go.yml?label=Action&logo=github&style=flat-square">
            </td>
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
            <td>🟡</td>
            <td><img src="https://img.shields.io/github/actions/workflow/status/swimresults/import-service/go.yml?label=Action&logo=github&style=flat-square"></td>
        </tr>
        <tr>
            <td>meeting-service</td>
            <td>🔗 <a href="https://github.com/SwimResults/meeting-service">Link</a></td>
            <td>🟡</td>
            <td><img src="https://img.shields.io/github/actions/workflow/status/swimresults/meeting-service/go.yml?label=Action&logo=github&style=flat-square"></td>
        </tr>
    </tbody>
</table>

**Status:**
🟢 Done
🟡 In Development
🔴 Open




## Infrastructure

### Microservices

```mermaid
flowchart TD
    A[Import Service]
    B[Athlete Service]
    C[User Service]
    D[Meeting Service]
    E[Start Service]
    
    A --> |import events| D
    A --> |import athletes and teams| B
    A --> |import starts and results| E
    C --> |users favorits| B
    D --> |organizing team| B
    E --> |each start has athlete| B
    E --> |each start has meeting and event| D
```
