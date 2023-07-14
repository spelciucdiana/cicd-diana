run:
	kubectl apply -f back-deployment.yaml
	kubectl apply -f my-secret.yaml
	kubectl apply -f back-service.yaml
	kubectl apply -f data-deployment.yaml
	kubectl apply -f data-service.yaml
	kubectl apply -f front-deployment.yaml
	kubectl apply -f front-service.yaml
	kubectl apply -f mysql-secret.yaml
	kubectl apply -f pv.yaml
	kubectl apply -f pvc.yaml


fill-db:
	kubectl apply -f data-script-deployment.yaml
	kubectl apply -f data-script-secret.yaml

stop:
	kubectl delete deployment api
	kubectl delete secret my-secrets
	kubectl delete service back
	kubectl delete deployment data
	kubectl delete service data
	kubectl delete deployment front
	kubectl delete service front 
	kubectl delete secret mysql-secrets


clean: stop
	kubectl delete pvc mysql-pvc

.PHONY: 
	run fill-db stop clean
