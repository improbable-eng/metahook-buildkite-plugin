echoerr() {
  echo "$@" 1>&2;
}

run_hook_when_needed() {
  hook_name="${1:?1st arg needs to be hook name}"

  upperd="$(echo "${hook_name}" | tr "[:lower:]" "[:upper:]")"
  var_name="BUILDKITE_PLUGIN_METAHOOK_${upperd//-/_}"
  if grep "${var_name}" <"${BUILDKITE_METAHOOK_VARS}"; then
    hook_file="${BUILDKITE_METAHOOK_HOOKS_PATH}/${hook_name}"
    echo "${!var_name}" >"${hook_file}"
    chmod +x "${hook_file}"
    source "${hook_file}"
  fi
}
