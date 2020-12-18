#!/usr/bin/bash


function my_help() {
  echo "- empezar jupyter -> ./run.sh jupyter"
	echo "- crear venv -> ./run.sh venv"
	exit 1
}
if [ $# -ne 1 ]
then
  my_help
fi

function run_jupyter() {
  ./venv/bin/jupyter serverextension enable --py jupyter_http_over_ws
  ./venv/bin/jupyter notebook \
  --NotebookApp.allow_origin='https://colab.research.google.com' \
  --port=8888 \
  --NotebookApp.port_retries=0
}

function venv() {
    sudo  apt-get install -y python3 python3-dev python3-pip python-virtualenv gcc g++ default-libmysqlclient-dev
    python -m virtualenv --python=python3 venv
    ./venv/bin/pip install -r requirements.txt
}


if [ "$1" == "jupyter" ];
then
	run_jupyter
elif [ "$1" == "venv" ];
then
	venv
else
  my_help
fi
exit 0