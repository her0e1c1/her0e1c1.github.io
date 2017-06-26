
start0:
	docker exec -it github yarn start0

start:
	docker exec -it github yarn start

build:
	-docker exec -it github yarn build

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
