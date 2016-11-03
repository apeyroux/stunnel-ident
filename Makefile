all:
	docker-compose rm -f
	docker-compose build
	docker-compose up

clean:
	sudo rm ./bin/*
