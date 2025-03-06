#!/usr/bin/env bash

cat keyd/00-*.conf \
    keyd/10-function-a.conf \
    keyd/20-*.conf \
    > chromebook.conf
