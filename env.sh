export JAVA_HOME=/opt/jdk1.8.0_60
export JRE_HOME=$JAVA_HOME/jre
export ZZDIR=$HOME/.funcoeszz/zz
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$HOME/.rbenv/bin:$JAVA_HOME/bin:$PATH

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
export ZZOFF=""  # desligue funcoes indesejadas
export ZZPATH="/home/faustovaz/.funcoeszz/funcoeszz"
source "$ZZPATH"
