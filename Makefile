build:
	docker build --tag slothai/openblas:dev .
sh:
	docker run -it slothai/openblas:dev /bin/sh
