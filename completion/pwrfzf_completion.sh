#!/usr/bin/env bash

# pwrfzf Bash completion script

_pwrfzf() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="-h --help --help-full -k --keybindings -V --version -c --config --depclean --preserved-rebuild --sync"

  case "${prev}" in
    -h|--help|--help-full|-k|--keybindings|-V|--version|--depclean|--preserved-rebuild|--sync)
      return 0
      ;;
  esac

  # Autocomplete die Argumente/Flags
  if [[ "${cur}" == -* ]]; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi

  # Fallback auf Standard-Datei/Ordner-Autovervollständigung für Query-Eingaben
  COMPREPLY=( $(compgen -f -- "${cur}") )
}

complete -F _pwrfzf pwrfzf
