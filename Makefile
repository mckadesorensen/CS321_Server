SELF_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
DIST_DIR := ${SELF_DIR}/dist

.ONESHELL:

.PHONY: container-shell

clean:
	rm -rf ${DIST_DIR}
	find workflows -name "*.pyc" -type f -delete
	find workflows -name __pycache__ -type d -delete

image: build/cs321.Dockerfile
	cd build && \
	docker build -f cs321.Dockerfile -t cs321builderdev .


container-shell:
	docker run -it --rm \
		-v ${CS321_ROOTDIR}/Project:/project \
		-v ~/.aws:/root/.aws \
		--name=cs321-dev \
		cs321builderdev:latest