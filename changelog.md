# Changelog

## 0.4.0

### Fixed

- Allow steps

### Removed

- **Breaking change** Windows Batch (`.bat`, `.cmd`) support.
    Sorry if this impacts you.

    To transition from a Windows Batch metahook like

    ```yaml
    - label: my-step
      command: echo "hello world"
      plugins:
        - improbable-eng/metahook:
            post-checkout.bat: scripts/windows-setup.bat
            post-artifact.bat: |
              call some-batch-file.bat
              echo "Step finished!"
    ```
