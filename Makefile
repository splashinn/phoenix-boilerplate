##################################################################
#### Bootstrap Commands
##################################################################

bootstrap:
	cp .env.template .env
	docker-compose run --rm --no-deps phx sh -c "\
		mix deps.get \
		&& mix deps.compile \
		&& mix ecto.setup"
	docker-compose run --rm --no-deps --workdir "/app/src/assets" phx sh -c "\
		npm install"

reset:
	docker-compose run --rm --no-deps phx sh -c "\
		rm -rf /app/src/deps/* \
		&& rm -rf /app/src/_build/dev/* \
		&& rm -rf /app/src/_build/test/*"
	docker-compose stop
	docker-compose rm -f
	rm -rf src/assets/node_modules


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


##################################################################
#### Release Commands
##################################################################

check.all:
	ENV=test docker-compose run --rm phx sh -c "sh /scripts/run-checks.sh"

build.release:
	rm -rf ./src/_build/prod/rel
	ENV=prod docker-compose run --rm --no-deps --workdir "/app/src/assets" phx sh -c "\
		npm install \
		&& npx brunch build --production"
	ENV=prod docker-compose run --rm --no-deps phx sh -c "\
		mix deps.get \
		&& mix deps.compile \
		&& mix phx.digest \
		&& mix release --no-tar --env=prod"
