
start:
	docker exec -it github yarn start

build:
	docker exec -it github yarn build

up:
	docker-compose up -d

docker-build:
	docker build -t github . --no-cache

# make add a=XXX
add:
	docker exec -it github yarn add ${a}
	docker commit github github	
