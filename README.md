# jvbriones.github.io

Personal site. Built using [Docusaurus](https://docusaurus.io/). Published at <https://jvbriones.github.io/>

## 🛠️ How to operate

Open a new PR to trigger the CI/CD pipeline.

### Local installation

``` bash
nvm use 20
yarn
```

### Local Development

``` bash
yarn start
```

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

### 🧪 Run Playwright tests

Firstly install playwright local dependencies:

> yarn playwright install

Create a local `.env` file with default values (.env.dist). Then run all the tests with:

> yarn test:e2e

or also by tagging a specific test as e.g. @wip and then:
> npx playwright test tests/e2e --grep '@wip'

## License

Open sourced under [CC-BY-SA-4.0 License](LICENSE.md).
