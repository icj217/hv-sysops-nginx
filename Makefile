IMAGE_NAME=icj217/hv-sysops-nginx:latest

build:
	docker build -t ${IMAGE_NAME} -f docker/Dockerfile .

publish:
	docker push icj217/hv-sysops-nginx:latest

run-dev:
	docker run -p 8080:80 -e "ENVIRON=dev" ${IMAGE_NAME}

run-prod:
	docker run -p 8080:80 -e "ENVIRON=prod" ${IMAGE_NAME}