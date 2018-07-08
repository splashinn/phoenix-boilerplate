# Phoenix 1.3 Bootsrap Project

A Template for web app projects using Phoenix Framework 1.3.3 + Distillery

## What includes?

- Phoenix Framework 1.3.3 and Elixir 1.6.61
- Distillery for production releases
- Pre hooks for run migrations in production
- Environment variables for settings
- Docker compose setup
- Ready for TDD

## Requirements

- Docker
- Docker Compose
- Cmake

## Rename the project

Run the script with the name you want for your project as a parameter
```
chmod +x rename.sh
./rename.sh my_project
```

## Run the project for development

### Dependencies

- Install Docker for Mac Os

```shell
Descargar https://download.docker.com/mac/stable/Docker.dmg
```

- Install Docker in Linux

```shell
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)
curl -L "https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

```

- Install cmake in macOS

```shell
brew install cmake
```

- Install cmake in Linux

```shell
apt-get install cmake
```

### Environment

- Just run the next command for build the environment

```shell
make bootstrap
```

- Test the installation running the service and open **http://localhost**

```shell
docker-compose up web
```

- If you have a pre commit hook for check tests and coverage

```shell
cp script/pre-commit.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

## Commands

### Bootrstrap commands

- make bootstrap: Create an enviroment and setup the project
- make reset: Reset all setups

### Docker commands

- make start: Start applications services
- make restart.phx: Restart web service
- make restart.postgres: Restart postgres service
- make stop.phx: Stop web service
- make stop.postgres: Stop postgres service
- make logs.phx: Show logs for web service
- make logs.postgres: Show logs for postgres service
- make shell.phx: Open a shell in web service container
- make shell.postgres: Open a shell in postgres service container

### Development commands

- make test: Run tests
- make test.shell: Open a shell for testing
- make credo: Run credo
- make coverage: Run coverage reports
- make gettext: Compile gettext
- make routes: Show routes
- make deps.update: Clean and update dependencies
- make ecto.reset: Delete database and recreate all
- make ecto.setup: Setup database and migrations
- make ecto.migrate: Run migrations
- make npm.install: Run npm install

## Make a release

Create a new release

    make build.release

Build a new docker images

    docker build -t <NAME:TAG> .

Submit to a repository

    docker push <NAME:TAG>
