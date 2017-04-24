
.PHONY: all tensorflow tensorboard
tensorflow:
	docker build -t tensorflow tensorflow
tensorboard:
	docker build -t tensorboard tensorboard

# docker run -p 8888:8888 -v $(PWD):/notebooks/workspace tensorflow
all: tensorflow tensorboard
