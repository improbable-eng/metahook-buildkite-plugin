# Changelog

## v0.4.1

### v0.4.1 Removed

- Removed `checkout`, same reason as `command`.

## v0.4.0

### v0.4.0 Fixed

- Allow multiple steps to use metahooks for the same hook but with different content.
- Inject `bash` shebang and Bash Strict Mode (`set -euo pipefail`) so that if metahooks fail with errors the job halts rather than continuing.

  Bash Strict Mode is provided by
  - `set -o errexit` - halt on error
  - `set -o nounset` - halt if variable is unset
  - `set -o pipefail` - halt if a command inside a pipe fails

  You can override those choices by setting different values (e.g. `set +o nounset`) within your metahook.

### v0.4.0 Removed

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
