#!/usr/bin/env bash

set -euo pipefail

cd keyd/

func_conf="function-a.conf"
echo "Choose the function key layout file:"

select conf in *.conf; do
    echo "Selected: ${conf}"
    func_conf="$conf"
    break
done

echo "Applying keyd config to '/etc/keyd/chromebook.conf'..."
cat "$func_conf" > /etc/keyd/chromebook.conf
chown root: /etc/keyd/chromebook.conf
chmod 644 /etc/keyd/chromebook.conf

echo "Install finished, please reload keyd"
