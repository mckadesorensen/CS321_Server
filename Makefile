SELF_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
DIST_DIR := ${SELF_DIR}/dist

.ONESHELL:

.PHONY: container-shell project

image: build/cs321.Dockerfile
	cd build && \
	docker build -f cs321.Dockerfile -t cs321builderdev .


container-shell:
	docker run -it --rm \
		-v ${CS321_ROOTDIR}/Project:/project \
		-v ~/.aws:/root/.aws \
		--name=cs321-dev \
		--workdir="/project" \
		cs321builderdev:latest

project:
	rm -f .terraform/environment
	terraform init	-reconfigure -input=false -no-color \
		-backend-config "region=${AWS_REGION}"
	terraform workspace new ${DEPLOY_NAME} || terraform workspace select ${DEPLOY_NAME}