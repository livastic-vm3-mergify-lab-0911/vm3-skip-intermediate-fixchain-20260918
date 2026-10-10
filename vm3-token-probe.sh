#!/usr/bin/env bash
set -euo pipefail
echo "VM3_TOKEN_PROBE_RUN=$GITHUB_RUN_ID"
echo "VM3_TOKEN_PROBE_HEAD=$GITHUB_SHA"
echo "VM3_TOKEN_PROBE_TARGET=vm3-synth-token-marker-261010"
git push origin HEAD:refs/heads/vm3-synth-token-marker-261010
echo "VM3_TOKEN_PROBE_PUSH=SUCCESS"
