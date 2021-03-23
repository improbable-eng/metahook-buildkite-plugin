#!/usr/bin/env bash
set -euo pipefail
hook_name="${1:?1st arg needs to be hook name}"

upperd="$(echo "${hook_name}" | tr "[:lower:]" "[:upper:]" | sed "s:-:_:")"
var_name="BUILDKITE_PLUGIN_METAHOOK_${upperd}"

echo "upperd=[${upperd}] var_name=[${var_name}]"

if grep -q "${var_name}" <"${BUILDKITE_METAHOOK_HOOKS_PATH}/vars"; then
  hook_file="${BUILDKITE_METAHOOK_HOOKS_PATH}/${hook_name}"

  printenv | grep BUILDKITE_PLUGIN | grep METAHOOK

  echo "hook_file=[${hook_file}]"
  echo "#\!/usr/bin/env bash" >"${hook_file}"
  echo "set -o errexit" >>"${hook_file}"
  echo "set -o nounset" >>"${hook_file}"
  echo "set -o pipefail" >>"${hook_file}"
  # Exclamation syntax here is dynamic variable expansion.
  # That is, use the var_name string to look up the value.
  echo "${!var_name}" >>"${hook_file}"
  chmod +x "${hook_file}"
  exec "${hook_file}"
fi
