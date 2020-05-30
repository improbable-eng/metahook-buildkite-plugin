# Metahook Buildkite Plugin

A Buildkite plugin that allows running additional commands as buildkite hooks on a per-step basis.

## Example

```yaml
common: &common
  plugins:
  - improbable-eng/metahook:
      post-checkout: scripts/setup.sh
      pre-exit: |
        scripts/cleanup.sh
        echo "Step finished!"
        scripts/notify.sh

steps:
  - label: "Build"
    command: "scripts/build.sh"
    <<: *common

  - label: "Test"
    command: "scripts/test.sh"
    <<: *common
```

Metahooks execute via a `bash` script, searching your `PATH` for `bash`.

Metahooks execute in Bash Strict Mode.

Bash Strict Mode is provided by

- `set -o errexit` - halt on error
- `set -o nounset` - halt if variable is unset
- `set -o pipefail` - halt if a command inside a pipe fails

You can override those choices by setting different values (e.g. `set +o nounset`) within your metahook.

## Contributing

See [contributing](contributing.md)
