local_run: vendorize
	bk local run .buildkite/local-pipeline.yml

vendorize:
	mkdir .buildkite/plugins/metahook -p
	cp hooks python plugin.yml .buildkite/plugins/metahook/ -rf
