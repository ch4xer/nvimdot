redraw-prompt() {
  local f
  for f in chpwd "${chpwd_functions[@]}" precmd "${precmd_functions[@]}"; do
    [[ "${+functions[$f]}" == 0 ]] || "$f" &>/dev/null || true
  done
  p10k display -r
}

cd_fzf() {
    # local fzf_result=$(fzf)
    local fzf_result=$(fd . --hidden --exclude={.wine,.git,.idea,.vscode,.sass-cache,node_modules,build,.steam,.m2,.rangerdir,.ghidra,.mozilla,.cache} | fzf)
    if [ -z "$fzf_result" ]
    then
        echo "No Directory specific"
    else
        if [ -d "$fzf_result" ]; then
            cd $fzf_result
        else
            local directory=$(dirname $fzf_result)
            cd $fzf_result
        fi
    fi
    redraw-prompt
}

cd_fzf_from_home() {
    # local fzf_result=$(fzf)
    local fzf_result=$(fd . /home/ch4ser --hidden --exclude={.wine,.git,.idea,.vscode,.sass-cache,node_modules,build,.steam,.m2,.rangerdir,.ghidra,.mozilla,.cache} | fzf)
    if [ -z "$fzf_result" ]
    then
        echo "No Directory specific"
    else
        if [ -d "$fzf_result" ]; then
            cd $fzf_result
        else
            local directory=$(dirname $fzf_result)
            cd $fzf_result
        fi
    fi
    redraw-prompt
}

open_fzf() {
    local fzf_result=$(fd . $1 --type f --hidden --exclude={.wine,.git,.idea,.vscode,.sass-cache,node_modules,build,.steam,.m2,.rangerdir,.ghidra,.mozilla,.cache} | fzf)
    local result_type=$(file -0 "$fzf_result" | cut -d $'\0' -f2)
    if [ -z "$fzf_result" ]
    then
        echo "No file specific"
    else
        case "$result_type" in
            (*text*)
                nvim $fzf_result
                ;;
            (*)
                xdg-open $fzf_result &
                ;;
        esac
    fi
    redraw-prompt
}

filemanager() {
    echo -e "\e]2;>RANGER<\007"
    ranger --choosedir=$HOME/.rangerdir < $TTY
    LASTDIR=`cat $HOME/.rangerdir`
    cd "$LASTDIR"
    zoxide add "$LASTDIR"
    redraw-prompt
}

man() {
    local width=$(tput cols)
    [ $width -gt $MANWIDTH ] && width=$MANWIDTH
    env MANWIDTH=$width \
    man "$@"
}
# make alacritty show current directory in title
precmd() {
    [[ $TERM == "xterm-256color" ]] && print "\033]0;:> $(pwd)"
}

code()
{
    if [ -d "${1}" ]; then
        local dir="${1}"
        shift 1
        ( cd "${dir}" && NVIM_GUI="2" alacritty --class 'neovide' -e 'nvim' . &)
    else
        nvim "${@}"
    fi
}


zle -N cd_fzf
zle -N cd_fzf_from_home
zle -N open_fzf
zle -N filemanager
