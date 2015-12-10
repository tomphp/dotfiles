# vim: syntax=sh

# Tab Completion for Bash
if $BREW_INSALLED && [[ -f $(brew --prefix)/etc/bash_completion ]]; then
    . $(brew --prefix)/etc/bash_completion
fi
