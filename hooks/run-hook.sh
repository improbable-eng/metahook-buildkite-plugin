#!/usr/bin/env bash

hook_name="${1:?1st arg needs to be hook name}"

upperd="$(echo "${hook_name}" | tr "[:lower:]" "[:upper:]")"
var_name="BUILDKITE_PLUGIN_METAHOOK_${upperd//-/_}"
if grep -q "${var_name}" <"${BUILDKITE_METAHOOK_VARS}"; then
  hook_file="${BUILDKITE_METAHOOK_HOOKS_PATH}/${hook_name}"
  echo "${!var_name}" >"${hook_file}"
  chmod +x "${hook_file}"
  "${hook_file}"
fi
