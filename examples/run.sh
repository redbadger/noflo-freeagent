#!/bin/bash

if [ -z "$1" ]; then
  echo "usage: run_fbp.sh example_flow.fbp"
  exit    1
fi

EXAMPLE_DIR=`dirname $0`
TOP_DIR=`dirname $0`/..

cd "$TOP_DIR"

if [ ! -f "$EXAMPLE_DIR/$1" ]; then
  noflo "examples/$1"
else
  echo "Example $1 not found in the $EXAMPLE_DIR directory."
fi

