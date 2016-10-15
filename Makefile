all:
	sudo rm ./bin/*
	docker-compose rm -f
	docker-compose build
	docker-compose up
