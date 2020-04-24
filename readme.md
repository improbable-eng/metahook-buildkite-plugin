# Metahook Buildkite Plugin

A Buildkite plugin that allows running additional commands as buildkite hooks on a per-step basis.

## Example

```yaml
common: &common
  plugins:
  - improbable-eng/metahook:
      post-checkout: scripts/setup.sh
      post-checkout.bat: scripts/windows-setup.bat
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

## Contributing

See <contributing.md>.
