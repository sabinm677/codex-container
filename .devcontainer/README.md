# Codex Devcontainer

A boilerplate project for running Codex CLI in a network-restricted devcontainer.

Install it into the current Git repository:

```sh
curl -fsSL https://raw.githubusercontent.com/sabinm677/codex-container/develop/install.sh | bash
```

The installer refuses to overwrite existing `.devcontainer` or `sc` directories.

Start and connect to the container:

```sh
sc/container/up
sc/container/connect
```

Authenticate with device login, then start an interactive session:

```sh
codex login --device-auth
sc/codex
```

For API key authentication, set `OPENAI_API_KEY` and run:

```sh
printenv OPENAI_API_KEY | codex login --with-api-key
```

Remove the container and its image while preserving Codex sessions and shell history:

```sh
sc/container/down
```

Remove the container, image, Codex sessions, authentication, and shell history:

```sh
sc/container/destroy
```

`sc/codex` bypasses Codex approvals and its built-in sandbox. Use it only inside
this container; outbound access is restricted by `init-firewall.sh`.
