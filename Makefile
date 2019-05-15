IMAGE_REPO := foostan/kodedeploy-cmd-executor

all: build

.PHONY: build
build:
	docker build -t $(IMAGE_REPO) .

deploy: build
	docker push $(IMAGE_REPO):latest
