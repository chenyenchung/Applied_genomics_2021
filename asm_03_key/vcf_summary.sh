#!/bin/bash

cut -f 8 $1 | tr ";" "\n" | grep ANN= | tr "," "\n" | sed 's/ANN=//' |  tr "|" "\t" | cut -f 1-4,11 | column -t
