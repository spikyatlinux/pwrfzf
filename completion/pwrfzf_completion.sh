#!/usr/bin/env bash

# pwrfzf Bash completion script

_pwrfzf() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="-h --help -k --keybindings -V --version"

  case "${prev}" in
    -h|--help|-k|--keybindings|-V|--version)
      return 0
      ;;
  esac

  if [[ "${cur}" == -* ]]; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi

  COMPREPLY=( $(compgen -f -- "${cur}") )
}

complete -F _pwrfzf pwrfzf

