#!/bin/bash

echo $1 | tr [:punct:] _ | tr [:lower:] [:upper:]
