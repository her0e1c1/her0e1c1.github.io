
start:
	docker exec -it github yarn start

start0:
	docker exec -it github yarn start0

build:
	-docker exec -it github yarn build

up:
	docker-compose up -d

docker-build:
	docker build -t github . --no-cache

# make add a=XXX
add:
	docker exec -it github yarn add ${a} --modules-folder /app/node_modules
	docker commit github github	

commit: build
	git add index.html home.js styles.css
	git commit -m 'update'
	git push
