
- To generate a migration file to take database from state in --dev-url to state in -to
```bash

 docker run --rm --net=host \
  -v $(pwd)/db/migrations:/migrations \
 arigaio/atlas migrate diff create_database \
  --dir "file://migrations" \
  --dev-url "postgresql://postgres:postgres@localhost:6434/migration?sslmode=disable&search_path=public" \
  --to "postgresql://postgres:postgres@localhost:6433/migration?sslmode=disable&search_path=public"



```
- To generate a hcl detailing the current state of the database
```bash

 
 docker run --rm --net=host \
  -v $(pwd)/db/migrations:/migrations \
 arigaio/atlas schema inspect -u "postgresql://postgres:postgres@localhost:6433/migration?sslmode=disable&search_path=public"  > db/schema.hcl

```

- To generate next migration file
```bash

docker run --rm --net=host \
  -v $(pwd)/db/migrations:/migrations \
  -v $(pwd)/db/schema.hcl:/schema.hcl \
  arigaio/atlas migrate diff initial --dir "file:///migrations" --to "file:///schema.hcl" --dev-url "postgresql://postgres:postgres@localhost:6434/migration?sslmode=disable&search_path=public"

```
I cant use the dev database because it requires docker : => "docker://postgres/15/test?search_path=public"