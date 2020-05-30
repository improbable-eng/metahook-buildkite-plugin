local_run: vendorize
	bk local run .buildkite/local-pipeline.yml

vendorize:
	rm -rf .buildkite/plugins/metahook
	mkdir -p .buildkite/plugins/metahook
	cp -rf hooks plugin.yml .buildkite/plugins/metahook/
