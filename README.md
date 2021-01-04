# Github Actions Runner

## Usage

- Create Dockerfile with base layer as follows:

```dockerfile
ARG RUNNER_VERSION=latest
FROM bndigital/github-actions-runner:${RUNNER_VERSION}
```

- Build image passing required arguments:
    - `GITHUB_ORGANIZATION`: your Github organization name (e.g. [**bn-digital**](https://github.com/bn-digital))
    - `GITHUB_TOKEN`: your Github organization token (e.g. **ABCDEFGH1234IJKLMNOP5678QRST**)

```shell
docker build -t cri.bndigital.co/github-actions-runner:latest --build-arg=GITHUB_ORGANIZATION=bn-digital --build-arg=GITHUB_TOKEN=ABCDEFGH1234IJKLMNOP5678QRST .
```
