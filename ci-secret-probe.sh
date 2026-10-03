#!/usr/bin/env bash
set -euo pipefail
echo "VM3_SECRET_PROBE_SCRIPT=ATTACKER_CONTROLLED"
if [ -n "${VM3_MQ_FORK_SECRET_CANARY:-}" ]; then
  echo "VM3_DUMMY_SECRET_PRESENT=1"
  printf '%s' "$VM3_MQ_FORK_SECRET_CANARY" | sha256sum | awk '{print "VM3_DUMMY_SECRET_SHA256="$1}'
else
  echo "VM3_DUMMY_SECRET_PRESENT=0"
  echo "VM3_DUMMY_SECRET_SHA256=NONE"
fi
