DB_URL=postgresql://postgres:postgres@localhost:6433/migration?sslmode=disable&search_path=public
TEMP_DB_URL=postgresql://postgres:postgres@localhost:6434/migration?sslmode=disable&search_path=public

createdb:
	docker compose -p "migration_db" -f "devops/dev/docker-compose.yml" up

destroydb:
	docker compose -p "migration_db" down --remove-orphans --volumes

createtempdb:
	docker compose -p "migration_temp_db" -f "devops/temp/docker-compose.yml" up

destroytempdb:
	docker compose -p "migration_temp_db" down --remove-orphans --volumes

createmigration:
	docker run --rm --net=host \
  		-v ${PWD}/db/migrations:/migrations \
 		arigaio/atlas schema inspect -u "$(DB_URL)"  > db/schema.hcl 

	docker run --rm --net=host \
  		-v ${PWD}/db/migrations:/migrations \
  		-v ${PWD}/db/schema.hcl:/schema.hcl \
 	 	arigaio/atlas migrate diff change --dir "file:///migrations" --to "file:///schema.hcl" --dev-url "$(TEMP_DB_URL)" --format '{{ sql . "  " }}'

makemigration:
	docker run --rm --net=host \
  		-v ${PWD}/db/migrations:/migrations \
 	 	arigaio/atlas migrate apply --dir "file:///migrations" --url "$(TEMP_DB_URL)"



.PHONY: createdb destroydb createtempdb destroytempdb createmigration makemigration