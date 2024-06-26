#!/usr/bin/env bash

if [ ! -f "unittest/utils/anchor" ] || [ "$(head -1 unittest/utils/anchor)" != "unittest/utils | unittest" ]; then echo "Anchor [unittest/utils] not found!"; exit 1; fi

if [ -n "$onQemu" ]; then
    utils/build-debug-dev.sh
    export PATH="$PATH:$(pwd)/build-debug-dev"
else
    utils/build-debug.sh
    export PATH="$PATH:$(pwd)/build-debug"
fi

export suitePath="$(pwd)/unittest/test-suite"