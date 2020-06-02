#!/usr/bin/env bash
set -euo pipefail
hook_name="${1:?1st arg needs to be hook name}"

upperd="$(echo "${hook_name}" | tr "[:lower:]" "[:upper:]" | sed "s:-:_:")"
var_name="BUILDKITE_PLUGIN_METAHOOK_${upperd}"

if grep -q "${var_name}" <"${BUILDKITE_METAHOOK_HOOKS_PATH}/vars"; then
  hook_file="${BUILDKITE_METAHOOK_HOOKS_PATH}/${hook_name}"

  echo "${!var_name}" >"${hook_file}"
  chmod +x "${hook_file}"
  "${hook_file}"
fi
