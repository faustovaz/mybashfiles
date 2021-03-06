get_ibge_maps(){
  local LINK="ftp://geoftp.ibge.gov.br/malhas_digitais/municipio_2010/"
  local filenames=( ac.zip al.zip am.zip ap.zip ba.zip ce.zip df.zip
                    es.zip go.zip ma.zip mg.zip ms.zip mt.zip pa.zip
                    pb.zip pe.zip pi.zip pr.zip rj.zip rn.zip ro.zip
                    rr.zip rs.zip sc.zip se.zip sp.zip to.zip)
  for fileToDownload in "${filenames[@]}"; do
      wget "$LINK$fileToDownload"
      unzip  "$fileToDownload"
  done;
}

youtube_to_mp3(){
  hash youtube-dl 2> /dev/null
  if [ "$?" -eq 1 ]; then
    echo "youtube_to_mp3: youtube-dl not found. Please install it!"
    return
  fi
  hash ffprobe 2> /dev/null
  if [ "$?" -eq 1 ]; then
    echo "youtube_to_mp3: ffprobe not found. Please Install it!"
    echo "youtube_to_mp3: Install ffmpeg to get ffprobe"
    echo "To install ffmpeg:
          sudo add-apt-repository ppa:kirillshkrogalev/ffmpeg-next
          apt-get install ffmpeg"
    return
    #
  fi
  if [ -z "$1" ]; then
    echo "youtube_to_mp3: Where is the youtube's url?"
    return
  fi
  youtube-dl -x --audio-quality 0 --audio-format mp3 "$1"
}

pyenv_update(){
  local ACTUAL_PATH=$(pwd)
  local PYENV_DIR
  if [ -n "$PYENV_ROOT" ]; then
    PYENV_DIR=$PYENV_ROOT
  else
    PYENV_DIR=$HOME/.pyenv
  fi
  cd $PYENV_ROOT
  git pull --rebase
  cd $PYENV_ROOT/plugins/pyenv-virtualenv
  git pull --rebase
  cd $ACTUAL_PATH
}

rbenv_update(){
  local ACTUAL_PATH=$(pwd)
  local RBENV_DIR
  if [ -n "$RBENV_ROOT" ]; then
    RBENV_DIR=$RBENV_ROOT
  else
    RBENV_DIR=$HOME/.rbenv
  fi
  cd $RBENV_DIR
  git pull --rebase
  cd $RBENV_DIR/plugins/ruby-build
  git pull --rebase
  cd $ACTUAL_PATH
}

funcoeszz_update(){
  local ACTUAL_PATH=$(pwd)
  cd $HOME/.funcoeszz
  local ACTIVE_BRANCH="$(git_branch)"
  if [ "$ACTIVE_BRANCH" = "master" ]; then
    git fetch upstream
    git merge upstream/master
    git push origin master
  else
    echo "Not in branch master"
  fi
  cd "$ACTUAL_PATH"
}

atom_update(){
  echo "Updating the best editor ever!!!"
  wget -O /tmp/latest_atom.deb https://atom.io/download/deb
  sudo dpkg -i /tmp/latest_atom.deb
}

dbeaver_update(){
  wget -O /tmp/latest_dbeaver.deb http://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb
  sudo dpkg -i /tmp/latest_dbeaver.deb
}

euro_hoje (){
  lynx -dump -nolist http://dolarhoje.com/euro/ | grep R\\$ | sed 's/_//g'
}

libra_hoje(){
  lynx -dump -nolist http://dolarhoje.com/libra/ | grep R\\$ |  sed 's/_//g'
}

dolar_hoje(){
  lynx -dump -nolist http://dolarhoje.com | grep R\\$ | sed 's/_//g'
}

dolar_no_paragua(){
  dolar=$(lynx -dump -nolist http://comprasparaguai.com.br | grep R\\$ | sed 's/\$/\$ /g')
  echo "Dolar no paragua hoje: $dolar"
}

install_pyenv(){
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
  git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
}

install_rbenv(){
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
}
