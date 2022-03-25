#!/bin/bash

echo "** Starting Signaling DP server **"

kill -9 $(pgrep -f signaling_websockets_server.py)

logging_directory=$1
server_directory=$2

rm "${logging_directory}/signaling_dp_server_log"
rm "${logging_directory}/signaling_dp_server_metrics"

touch "${logging_directory}/signaling_dp_server_log"
touch "${logging_directory}/signaling_dp_server_metrics"
export SIGNALING_DP_SERVER_LOG_FILE="${logging_directory}/signaling_dp_server_log"
export SIGNALING_DP_SERVER_METRICS_FILE="${logging_directory}/signaling_dp_server_metrics"

cd $server_directory

export SIGNALING_DP_SERVER_LOG_FILE="/tmp/signaling_dp_server_log"
export SIGNALING_DP_SERVER_METRICS_FILE="/tmp/signaling_dp_server_metrics"
python3 signaling_websockets_server.py &