# Contributing

```bash
make vendorize local_run
```

On macOS & linux, the output should contain

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
