# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1
export ZSH="$HOME/.oh-my-zsh"
source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(git web-search )
source $ZSH/oh-my-zsh.sh
alias v="nvim"
alias py="python3"
alias ls="lsd"
alias cat="batcat --paging=never"
eval "$(starship init zsh)"
function fixsnap(){
  echo $( sudo snap remove starship )
  echo $( sudo snap install starship )
  echo $( source ~/.zshrc )
}
function pushing() {
  echo  $( git add .  && git commit -m "$1" && git push) 
}

