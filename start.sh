#!/bin/sh
node generator/src &
node deliverer/src &
cd viewer && npm start
