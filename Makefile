
.PHONY: all tensorflow tensorboard
tensorflow:
	docker build -t tensorflow tensorflow
tensorboard:
	docker build -t tensorboard tensorboard
publish:
	docker tag tensorflow rmeertens/tensorflow
	docker push rmeertens/tensorflow
	docker tag tensorboard rmeertens/tensorboard
	docker push rmeertens/tensorboard
# docker run -p 8888:8888 -v $(PWD):/notebooks/workspace tensorflow
all: tensorflow tensorboard
