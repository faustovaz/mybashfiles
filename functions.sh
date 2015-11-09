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
