HOST=${HOST:-localhost}
PORT=${PORT:-50000}
export HTTP_PROXY=http://$HOST:$PORT
export HTTPS_PROXY=http://$HOST:$PORT
export ALL_PROXY=http://$HOST:$PORT
export http_proxy=http://$HOST:$PORT
export https_proxy=http://$HOST:$PORT
export all_proxy=http://$HOST:$PORT
