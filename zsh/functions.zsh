function compress(){
  tar --use-compress-program pigz -cvf $1.tar.xz $1
}

function arte-dl(){
  youtube-dl --sub-lang en,de --output "$HOME/Downloads/arte/%(title)s.%(ext)s" --external-downloader aria2c --external-downloader-args '-c -j 10 -x 10 -s 10 -k 1M' $1
}

function artep-dl(){
  youtube-dl --sub-lang en,de --output "$HOME/Downloads/arte/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --external-downloader aria2c --external-downloader-args '-c -j 10 -x 10 -s 10 -k 1M' $1
}

function idea() {
  open -na "IntelliJ IDEA.app" --args "$@"
}

function ltedit() {
  open -na "IntelliJ IDEA.app" --args -e "$@"
}
