# Competions for work
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
source <(kubectl completion zsh)
source <(helm completion zsh)
# foldend
#
alias kubectl=kubecolor
compdef kubecolor=kubectl

