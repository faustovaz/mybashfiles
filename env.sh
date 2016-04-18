export JAVA_HOME=/opt/jdk1.8.0_60
export JRE_HOME=$JAVA_HOME/jre
export ZZDIR=$HOME/.funcoeszz/zz
export PATH=$HOME/.rbenv/bin:$JAVA_HOME/bin:$PATH

eval "$(rbenv init -)"

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
export ZZOFF=""  # desligue funcoes indesejadas
export ZZPATH="$HOME/.funcoeszz/funcoeszz"
source "$ZZPATH"
