# Contributing

```bash
make vendorize local_run
```

## Expected output

### On macOS & linux, the output should contain

```txt
~~~ Running plugin metahook pre-command hook
$ .buildkite/plugins/metahook/hooks/pre-command
pre-command hook
with two commands

~~~ Running commands
$ trap 'kill -- $$' INT TERM QUIT; echo "Hello World"
Hello World

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
> cd C:\metahook-buildkite-plugin

~~~ Running plugin metahook environment hook
> .buildkite\plugins\metahook\hooks\environment
> cd C:\metahook-buildkite-plugin\c\metahook-buildkite-plugin
# BUILDKITE_METAHOOK_VARS changed
# BUILDKITE_METAHOOK_HOOKS_PATH changed

~~~ Running plugin metahook pre-command hook
> .buildkite\plugins\metahook\hooks\pre-command
BUILDKITE_PLUGIN_METAHOOK_PRE_COMMAND=echo "pre-command hook"
pre-command hook
with two commands
> cd C:\metahook-buildkite-plugin\c\metahook-buildkite-plugin

~~~ Running plugin metahook command hook
> .buildkite\plugins\metahook\hooks\command
> cd C:\metahook-buildkite-plugin\c\metahook-buildkite-plugin

~~~ Running plugin metahook post-command hook
> .buildkite\plugins\metahook\hooks\post-command
BUILDKITE_PLUGIN_METAHOOK_POST_COMMAND=echo "post-command hook"
post-command hook
> cd C:\metahook-buildkite-plugin\c\metahook-buildkite-plugin

~~~ Running plugin metahook pre-exit hook
> .buildkite\plugins\metahook\hooks\pre-exit
BUILDKITE_PLUGIN_METAHOOK_PRE_EXIT=echo "pre-exit hook"
pre-exit hook
> cd C:\metahook-buildkite-plugin\c\metahook-buildkite-plugin

>>> Command succeeded in 3.1585511s
>>> Executing command step Like we did last summer

~~~ Preparing plugins
> cd C:\metahook-buildkite-plugin

~~~ Running plugin metahook environment hook
> .buildkite\plugins\metahook\hooks\environment
> cd C:\metahook-buildkite-plugin\c\metahook-buildkite-plugin
# BUILDKITE_METAHOOK_HOOKS_PATH changed
# BUILDKITE_METAHOOK_VARS changed

~~~ Running plugin metahook pre-command hook
> .buildkite\plugins\metahook\hooks\pre-command
BUILDKITE_PLUGIN_METAHOOK_PRE_COMMAND=echo "plague hook"
plague hook
with two commands
> cd C:\metahook-buildkite-plugin\c\metahook-buildkite-plugin

~~~ Running plugin metahook command hook
> .buildkite\plugins\metahook\hooks\command
> cd C:\metahook-buildkite-plugin\c\metahook-buildkite-plugin

~~~ Running plugin metahook post-command hook
> .buildkite\plugins\metahook\hooks\post-command
BUILDKITE_PLUGIN_METAHOOK_POST_COMMAND=echo "post-command summer hook"
post-command summer hook
> cd C:\metahook-buildkite-plugin\c\metahook-buildkite-plugin

~~~ Running plugin metahook pre-exit hook
> .buildkite\plugins\metahook\hooks\pre-exit
BUILDKITE_PLUGIN_METAHOOK_PRE_EXIT=echo "pre-exit summer hook"
pre-exit summer hook
> cd C:\metahook-buildkite-plugin\c\metahook-buildkite-plugin

>>> Command succeeded in 5.0973937s
>>> Build finished in 5.1013827s
```
