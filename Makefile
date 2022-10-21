bundle:
	tar -czvf bundle.tar.gz -C ./src .
push:
	oras push ghcr.io/kevinswiber/openapi-opa:latest --config manifest-config.json:application/vnd.oci.image.config.v1+json bundle.tar.gz:application/vnd.oci.image.layer.v1.tar+gzip
docs:
	opa inspect -a ./src > docs/policies.txt

.PHONY: bundle push docs
