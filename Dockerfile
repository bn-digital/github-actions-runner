FROM debian:buster-slim
WORKDIR /actions-runner
ENV RUNNER_VERSION="2.275.1" \
    RUNNER_ALLOW_RUNASROOT=1
RUN apt-get update \
 && apt-get install \
      --yes \
        wget \
        tar \
        icu-devtools \
 && wget https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -O- | tar xzv \
 && apt-get autoclean \
 && apt-get autoremove \
      --yes
ONBUILD ARG GITHUB_ORGANIZATION
ONBUILD ARG GITHUB_TOKEN
ONBUILD RUN ./config.sh --url https://github.com/${GITHUB_ORGANIZATION} --token ${GITHUB_TOKEN} \
ONBUILD ENTRYPOINT ["./run.sh"]
