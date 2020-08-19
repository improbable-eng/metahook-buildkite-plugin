# Changelog

## v0.4.0

- **Breaking change** Removed support for `command` metahook.

    Buildkite special-cases this which triggers edge-cases that a `command` metahook would need to work around.

    If you want to override behaviour here, you will need to modify the automation you're running rather than inject a difference via metahook.

- **Breaking change** Removed Windows Batch (`.bat`, `.cmd`) support.

    Sorry if this impacts you.

    To transition from a Windows Batch metahook like

    ```yaml
    - label: my-step
      command: echo "hello world"
      plugins:
        - improbable-eng/metahook#0.3.0:
            post-checkout.bat: scripts/windows-setup.bat
            post-artifact.bat: |
              call some-batch-file.bat
              echo "Step finished!"
    ```

    to

    ```yaml
    - label: my-step
      command: echo "hello world"
      plugins:
        - improbable-eng/metahook#0.4.0:
            post-checkout: scripts/windows-setup.sh
            post-artifact: |
              some-bash-script-that-was-the-batch-file.sh
              echo "Step finished!"
    ```

    To transition Windows Batch shell scripts to bash shell scripts [here is a porting guide](https://www.tldp.org/LDP/abs/html/dosbatch.html).
