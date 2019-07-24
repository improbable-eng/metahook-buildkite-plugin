# Metahook Buildkite Plugin

A Buildkite plugin that allows running additional commands as buildkite hooks on a per-step basis.

# Example

```yaml
common: &common
  plugins:
  - ca-johnson/metahook:
      post-checkout: scripts/setup.sh
      pre-exit: scripts/cleanup.sh

steps:
  - label: "Build"
    command: "scripts/build.sh"
    <<: *common

  - label: "Test"
    command: "scripts/test.sh"
    <<: *common  
```