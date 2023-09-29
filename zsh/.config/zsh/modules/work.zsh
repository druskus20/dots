# Competions 
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
source <(helm completion zsh)
source <(kubectl completion zsh)
alias kubectl=kubecolor
compdef kubecolor=kubectl

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/drusk/work/infrastructure-utils/google-cloud-sdk/path.zsh.inc' ]; then . '/home/drusk/work/infrastructure-utils/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/drusk/work/infrastructure-utils/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/drusk/work/infrastructure-utils/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$PATH:$HOME/.local/bin/elk"

# Prompt
function update_prompt_info {
    : "${AWS_PROFILE:=default}"
    : "${AWS_REGION:=eu-central-1}"
    ZSH_AWS_PROFILE=" $AWS_PROFILE "
    ZSH_AWS_REGION=" $AWS_REGION "
    [ -z "$AWS_ROLE_SESSION_NAME" ] || ZSH_AWS_ROLE="ﴣ ${AWS_ROLE_SESSION_NAME} "
    ZSH_K8S_CLUSTER=" $(kubectl config current-context 2>/dev/null) "
    ZSH_K8S_NAMESPACE=" $(kubectl config view --minify | grep namespace: | awk '{print $2}') "
    if [[ $ZSH_K8S_NAMESPACE == "  " ]] ; then
	ZSH_K8S_NAMESPACE=""
    fi
    if [[ -d .terraform ]]; then
        ZSH_TERRAFORM_INDICATOR=" $(terraform version | head -n 1 | awk '{print $2}') "
    else
        ZSH_TERRAFORM_INDICATOR=""
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd update_prompt_info

PROMPT+='%k%f%B' # Clean
PROMPT+='╭ '
# Orange
PROMPT+='%F{208}'
PROMPT+='$ZSH_AWS_PROFILE'
# dark orange
PROMPT+='%F{166}'
PROMPT+='$ZSH_AWS_ROLE'
# Light orange
PROMPT+='%F{214}'
PROMPT+='$ZSH_AWS_REGION'
# Dark blue
PROMPT+='%F{111}'
PROMPT+='$ZSH_K8S_CLUSTER'
# Light blue
PROMPT+='%F{117}'
PROMPT+='$ZSH_K8S_NAMESPACE' 
# Purple pink
PROMPT+='%F{135}'
PROMPT+='$ZSH_TERRAFORM_INDICATOR'
PROMPT+='%k%f%b' # Clean
PROMPT+=$'\n' 


#PROMPT+="\033[38;5;208m" # Orange text for AWS profile
#PROMPT+='╭ '
#PROMPT+="$ZSH_AWS_PROFILE"
#PROMPT+="\033[38;5;214m" # Light orange text for AWS region
#PROMPT+="$ZSH_AWS_REGION"
#PROMPT+="\033[38;5;166m" # Dark orange text for AWS role
#PROMPT+="$ZSH_AWS_ROLE"
#PROMPT+="\033[38;5;21m" # Blue text for K8S cluster
#PROMPT+="$ZSH_K8S_CLUSTER"
#PROMPT+="\033[38;5;57m" # Pink/purple text for Terraform indicator
#PROMPT+="$ZSH_TERRAFORM_INDICATOR"
#PROMPT+="\033[0m" # Reset to default text color
#PROMPT+=$'\n'

# unicode rounded thingies
# terraform (if Im in a terraform directory)
