#!/usr/bin/env bash

cd keyd/

func_conf="10-function-a.conf"
echo "Choose the function key layout file:"

select conf in 10-function-*.conf; do
    echo "Selected: ${conf}"
    func_conf="$conf"
    break
done

cat 00-*.conf \
    "${func_conf}" \
    20-*.conf \
    > ../chromebook.conf
