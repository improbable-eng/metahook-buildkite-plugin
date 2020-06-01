#!/usr/bin/env bash

hook_name="${1:?1st arg needs to be hook name}"

# The list of possible file extensions for hooks.
declare -a extensions=(
    ""
    ".bat"
    ".cmd"
)

for ext in "${extensions[@]}"; do
  upperd="$(echo "${hook_name}${ext}" | tr "[:lower:]" "[:upper:]" | tr .- _)"
  var_name="BUILDKITE_PLUGIN_METAHOOK_${upperd}"

  if grep -q "${var_name}" <"${BUILDKITE_METAHOOK_HOOKS_PATH}/vars"; then
    hook_file="${BUILDKITE_METAHOOK_HOOKS_PATH}/${hook_name}${ext}"
    echo "${!var_name}" >"${hook_file}"
    chmod +x "${hook_file}"
    if [[ ${ext} == "" ]]; then
      "${hook_file}"
    else
      cmd.exe /c "${hook_file}" # .bat or .cmd
    fi
  fi
done
