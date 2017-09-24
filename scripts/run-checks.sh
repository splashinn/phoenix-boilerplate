#!/bin/sh

# Revisamos tests
MIX_ENV=test mix test
TEST_RES=$?
if [ $TEST_RES -ne 0 ]
then
  exit $TEST_RES
fi

# Revisamos coverage y si hay menos de 75% lanzamos alerta
COVERAGE=$(MIX_ENV=test mix coveralls | grep TOTAL | sed 's/\[TOTAL\] //; s/\.[0-9]*%//')
if [ $COVERAGE -lt 75 ]
then
    echo "No puedes subir código con coverage menor a 75% tu coverage es de $COVERAGE%"
    exit 1
fi

# Revisamos credo
MIX_ENV=test mix credo
CREDO_RES=$?
if [ $CREDO_RES -ne 0 ]
then
  exit $CREDO_RES
fi
