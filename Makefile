WORK_DIR := $(CURDIR)
LOG_DIR := $(CURDIR)

BUILDER_IMAGE := tokyor201810:1
BUILDER_WORK_DIR := /home/rstudio
BUILDER_CMD := docker run -e PASSWORD=rstudio1 -d -v $(WORK_DIR):$(BUILDER_WORK_DIR) -w $(BUILDER_WORK_DIR) -p 8787:8787 $(BUILDER_IMAGE)

setup:
		docker build -t $(BUILDER_IMAGE) .

rebuild-image:
		docker rmi $(BUILDER_IMAGE)
		docker build -t $(BUILDER_IMAGE) .

rstudio:
		$(BUILDER_CMD)
