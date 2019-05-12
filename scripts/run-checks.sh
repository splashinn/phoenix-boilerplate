#!/bin/sh

# Test and coverage
MIX_ENV=test mix test --cover
TEST_RES=$?
if [ $TEST_RES -ne 0 ]
then
  exit $TEST_RES
fi

# Credo
MIX_ENV=test mix credo
CREDO_RES=$?
if [ $CREDO_RES -ne 0 ]
then
  exit $CREDO_RES
fi
