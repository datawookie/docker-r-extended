VERSION=4.0.0
IMAGE=datawookie/r-ver-extended

# IMAGE -----------------------------------------------------------------------

build:
	docker build -t $(IMAGE) -t $(IMAGE):$(VERSION) .

login:
	docker login

# First need to login.
#
push:
	docker push $(IMAGE)

pull:
	docker pull $(IMAGE)
