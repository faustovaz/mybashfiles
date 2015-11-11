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
    exit 1
  fi
  hash ffprobe 2> /dev/null
  if [ "$?" -eq 1 ]; then
    echo "youtube_to_mp3: ffprobe not found. Please Install it!"
    echo "youtube_to_mp3: Install ffmpeg to get ffprobe"
    exit 1
    #To install ffmpeg: sudo add-apt-repository ppa:kirillshkrogalev/ffmpeg-next
    #apt-get install ffmpeg
  fi
  if [ -z "$1" ]; then
    echo "youtube_to_mp3: Where is the youtube's url?"
    exit 1
  fi
  youtube-dl -x --audio-quality 0 --audio-format mp3 $1
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
