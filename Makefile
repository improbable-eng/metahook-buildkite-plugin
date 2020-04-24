local_run: vendorize
	bk local run .buildkite/local-pipeline.yml

vendorize:
	mkdir -p .buildkite/plugins/metahook
	cp -rf hooks python plugin.yml .buildkite/plugins/metahook/
