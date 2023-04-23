include .env
export

pgup:
	docker run -d \
		--name opencat \
		--hostname ${POSTGRES_HOST} \
		-e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
		-e POSTGRES_DB=${POSTGRES_DB} \
		-v /opt/volumes/postgres/:/var/lib/postgresql/data \
		-p ${POSTGRES_PORT}:5432 \
		postgres \
		&& docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' opencat

pgdrop:
	docker exec -it opencat \
      psql -U postgres -d ${POSTGRES_DB} -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"

migrate:
	go run cmd/migrator.go \
        "user=postgres password=${POSTGRES_PASSWORD} dbname=${POSTGRES_DB} sslmode=${POSTGRES_SSLMODE}" up

tikaup:
	docker run -p 9998:9998 --name cattika apache/tika

tikadown:
	docker stop cattika && docker rm cattika

down:
	docker stop opencat && docker rm opencat

serve:
	go run src/handlers/server.go

fd:
	go run cmd/for_development.go
