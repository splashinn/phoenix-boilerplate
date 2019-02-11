##################################################################
#### Bootstrap Commands
##################################################################

bootstrap:
	docker-compose run --rm --no-deps phx sh -c "\
		mix deps.get \
		&& mix deps.compile"
	docker-compose run --rm --no-deps --workdir "/app/src/assets" phx sh -c "\
		npm install"
	docker-compose run --rm phx sh -c "mix ecto.setup"
	docker-compose run --rm phx sh -c "echo '\n\n\nLLENA LOS DATOS PARA TU CERT LOCAL\n\n\n' \
		&& apk add -U openssl \
		&& openssl req -new -x509 -nodes -out priv/dev.crt -keyout priv/dev.key"

reset:
	docker-compose run --rm --no-deps phx sh -c "\
		rm -rf /app/src/deps/* \
		&& rm -rf /app/src/_build/dev/* \
		&& rm -rf /app/src/_build/test/* \
		&& rm -rf /app/src/assets/node_modules/* \
		&& rm -rf /app/src/priv/key.key \
		&& rm -rf /app/src/priv/key.crt"
	docker-compose stop
	docker-compose rm -f


##################################################################
#### Docker Commands
##################################################################

start:
	docker-compose up -d phx

restart.phx:
	docker-compose restart phx

restart.postgres:
	docker-compose restart postgres

stop.phx:
	docker-compose stop phx

stop.postgres:
	docker-compose stop postgres

logs.phx:
	docker-compose logs -f phx

logs.postgres:
	docker-compose logs -f postgres

shell.phx:
	docker-compose run --rm phx sh

shell.postgres:
	docker-compose run --rm postgres sh


##################################################################
#### Development Commands
##################################################################

test:
	ENV=test docker-compose run --rm  phx sh -c "mix test"

test.shell:
	ENV=test docker-compose run --rm phx sh

credo:
	ENV=test docker-compose run --rm --no-deps phx sh -c "mix credo"

coverage:
	ENV=test docker-compose run --rm phx sh -c "mix coveralls.html"

gettext:
	docker-compose run --rm --no-deps phx sh -c "\
		mix gettext.extract \
		&& mix gettext.merge priv/gettext"

routes:
	docker-compose run --rm --no-deps  phx sh -c "mix phx.routes"

deps.update:
	docker-compose run --rm --no-deps phx sh -c "\
		mix deps.clean --unused \
		&& mix deps.get \
		&& mix deps.compile"

ecto.reset:
	docker-compose run --rm phx sh -c "mix ecto.reset"

ecto.setup:
	docker-compose run --rm phx sh -c "mix ecto.setup"

ecto.migrate:
	docker-compose run --rm phx sh -c "mix ecto.migrate"

npm.install:
	docker-compose run --rm --no-deps --workdir "/app/src/assets" phx sh -c "npm install"
