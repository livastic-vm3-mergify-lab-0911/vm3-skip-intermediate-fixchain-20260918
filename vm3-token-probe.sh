#!/usr/bin/env bash
set -euo pipefail
TARGET=vm3-synth-token-victim-261011
echo "VM3_TOKEN_PROBE_RUN=$GITHUB_RUN_ID"
echo "VM3_TOKEN_PROBE_HEAD=$GITHUB_SHA"
echo "VM3_TOKEN_PROBE_TARGET=$TARGET"
git fetch origin "refs/heads/$TARGET:refs/remotes/origin/$TARGET"
git checkout --detach "refs/remotes/origin/$TARGET"
printf 'ATTACKER_SYNTH_WRITE_261011\n' > vm3-synth-token-victim.txt
git add vm3-synth-token-victim.txt
git -c user.name='VM3 Synthetic Token Probe' -c user.email='vm3-probe@example.invalid' commit -m 'VM3 synthetic-token existing branch write 261011'
git push origin "HEAD:refs/heads/$TARGET"
echo "VM3_TOKEN_PROBE_PUSH=SUCCESS"
