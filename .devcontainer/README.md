# Codex Devcontainer

A boilerplate project for running Codex CLI in a network-restricted devcontainer.

Start and connect to the container:

```sh
local/container/up
local/container/connect
```

Authenticate with device login, then start an interactive session:

```sh
codex login --device-auth
local/codex
```

For API key authentication, set `OPENAI_API_KEY` and run:

```sh
printenv OPENAI_API_KEY | codex login --with-api-key
```

Remove the container and its image while preserving Codex sessions and shell history:

```sh
local/container/down
```

Remove the container, image, Codex sessions, authentication, and shell history:

```sh
local/container/destroy
```

`local/codex` bypasses Codex approvals and its built-in sandbox. Use it only inside
this container; outbound access is restricted by `init-firewall.sh`.
