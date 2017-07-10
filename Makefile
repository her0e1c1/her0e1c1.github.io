
start0:
	docker exec -it github yarn start0

start:
	docker exec -it github yarn start

start-prod:
	docker exec -it github env NODE_ENV=production yarn start0

watch:
	watchmedo shell-command -p "*.tsx;*.ts" -R -c "make fmt" ./src

fmt:
	docker exec -it github yarn fmt

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
