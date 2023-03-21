
# alias ssh="kitty +kitten ssh"
alias msf="msfconsole"
alias timeshift="sudo timeshift"
alias clear_cache="yay -Scc;yay -Rns $(yay -Qtdq)"
alias clear_packages="yay -Qtdq | yay -Rs -"
alias idea="nohup /opt/intellij-idea-ultimate-edition/bin/idea.sh .  >/dev/null 2>&1 &"
alias vi="nvim"
alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR";zoxide add "$LASTDIR"'
alias nvmstart="source /usr/share/nvm/init-nvm.sh"
alias java7="/usr/lib/jvm/java-7-openjdk/bin/java"
alias javac7="/usr/lib/jvm/java-7-openjdk/bin/javac"
alias java8="/usr/lib/jvm/java-8-openjdk/bin/java"
alias javac8="/usr/lib/jvm/java-8-openjdk/bin/javac"
alias py="python"
alias ipy="ipython"
alias desktop="ssh root@192.168.31.247"
alias server="ssh root@103.149.91.46 -p 65522"
alias tencent="ssh root@120.53.236.211"
alias rasp="ssh root@192.168.31.135"
alias ubuntu="ssh root@192.168.59.119"
alias checklog="journalctl -xefu"

alias sshk="ssh -i .ssh/ssh.pem"
alias kali="ssh root@192.168.59.114"
# alias k="minikube kubectl --"
alias k="kubectl"
alias hm="helm"
alias faas="faas-cli"
alias cat="bat --style=plain --paging=never"
alias top="htop"
alias ls="exa --icons"
alias t="todo.sh"
alias cp="rsync -a"
alias d="docker"
alias dc="docker-compose"
alias docker_rm_all="docker ps -aq | xargs docker stop | xargs docker rm"
alias rslsync="rslsync --config ~/.config/rslsync/rslsync.conf"
alias mach_on='swaymsg input "1:1:AT_Translated_Set_2_keyboard" events toggle'

alias master="ssh root@192.168.31.171"
alias worker1="ssh root@192.168.31.152"
alias worker2="ssh root@192.168.31.86"

eval "$(zoxide init zsh --cmd cd)"

