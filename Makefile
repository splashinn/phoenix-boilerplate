##################################################################
#### GLobal Development Commands
##################################################################

phx.run:
	docker-compose run --service-ports phx iex --sname phx -S mix phx.server

phx.shell:
	docker-compose run --rm phx sh

psql.shell:
	docker-compose run --rm postgres psql -U postgres -h postgres

deps.update:
	docker-compose run --rm --no-deps \
		phx sh -c "mix deps.update && mix deps.compile"

test:
	ENV=test docker-compose run --rm  phx sh -c "mix test"

test.shell:
	ENV=test docker-compose run --rm  phx sh

test.cover:
	ENV=test docker-compose run --rm  phx sh -c "mix test --cover"

test.credo:
	ENV=test docker-compose run --rm  phx sh -c "mix credo"


##################################################################
#### Application Development Commands
##################################################################

gen.cert:
	docker-compose run --rm --no-deps \
		--workdir "/app/src/apps/$(app)" phx sh -c "mix phx.gen.cert"

npm.install:
	docker-compose run --rm --no-deps \
		--workdir "/app/src/apps/$(app)/assets" phx sh -c "npm install"

ecto.reset:
	docker-compose run --rm --workdir "/app/src/apps/$(app)" \
		phx sh -c "mix ecto.reset"

ecto.setup:
	docker-compose run --rm --workdir "/app/src/apps/$(app)" \
		phx sh -c "mix ecto.setup"

ecto.migrate:
	docker-compose run --rm --workdir "/app/src/apps/$(app)" \
		phx sh -c "mix ecto.migrate"
