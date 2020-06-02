# Contributing

```bash
make vendorize local_run
```

## Expected output

### On macOS & linux, the output should contain

```txt
~~~ Running plugin metahook environment hook
$ .buildkite/plugins/metahook/hooks/environment
# BUILDKITE_METAHOOK_HOOKS_PATH changed

~~~ Running plugin metahook pre-command hook
$ .buildkite/plugins/metahook/hooks/pre-command
pre-command hook
with two commands

~~~ Running plugin metahook command hook
$ .buildkite/plugins/metahook/hooks/command

~~~ Running plugin metahook post-command hook
$ .buildkite/plugins/metahook/hooks/post-command
post-command hook

~~~ Running plugin metahook pre-exit hook
$ .buildkite/plugins/metahook/hooks/pre-exit
pre-exit hook
```

### On Windows, the output should contain

```txt
>>> Executing command step Test

~~~ Preparing plugins
> cd C:\Users\Pete\src\improbable\metahook-buildkite-plugin

~~~ Running plugin metahook environment hook
> .buildkite\plugins\metahook\hooks\environment
> cd C:\Users\Pete\src\improbable\metahook-buildkite-plugin\c\Users\Pete\src\improbable\metahook-buildkite-plugin
# BUILDKITE_METAHOOK_HOOKS_PATH changed

~~~ Running plugin metahook pre-command hook
> .buildkite\plugins\metahook\hooks\pre-command
pre-command hook
with two commands
> cd C:\Users\Pete\src\improbable\metahook-buildkite-plugin\c\Users\Pete\src\improbable\metahook-buildkite-plugin

~~~ Running plugin metahook command hook
> .buildkite\plugins\metahook\hooks\command
> cd C:\Users\Pete\src\improbable\metahook-buildkite-plugin\c\Users\Pete\src\improbable\metahook-buildkite-plugin

~~~ Running plugin metahook post-command hook
> .buildkite\plugins\metahook\hooks\post-command
post-command hook
> cd C:\Users\Pete\src\improbable\metahook-buildkite-plugin\c\Users\Pete\src\improbable\metahook-buildkite-plugin

~~~ Running plugin metahook pre-exit hook
> .buildkite\plugins\metahook\hooks\pre-exit
pre-exit hook
> cd C:\Users\Pete\src\improbable\metahook-buildkite-plugin\c\Users\Pete\src\improbable\metahook-buildkite-plugin

>>> Command succeeded in 3.2662428s
>>> Build finished in 3.2672403s
```
