#!/bin/bash

# Run roq-gate-futures in the background with logging
nohup roq-gate-futures \
  --name "gate-futures" \
  --config_file gateio_live.toml \
  --client_listen_address ~/sockets/gateio.sock \
  --auth_keys_file ~/keys.json \
  --loop_sleep=0ns \
  --loop_timer_freq=250ns \
  --flagfile ~/opt/conda/envs/deploy/share/roq-gate-futures/flags/prod/flags-usdt.cfg \
  > gateway_logs/gateio.log 2>&1 &

# Run roq-udp-publisher in the background with logging
nohup roq-udp-publisher \
  --name=udp-publisher \
  --udp_snapshot_address=10.2.12.198 \
  --udp_snapshot_port=1500 \
  --udp_incremental_address=10.2.12.198 \
  --udp_incremental_port=1501 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_pub_london.sock \
  > gateway_logs/publisher_london.log 2>&1 &

# Run roq-udp-subscriber in the background with logging
nohup roq-udp-subscriber \
  --name=udp-subscriber \
  --udp_snapshot_address=0.0.0.0 \
  --udp_snapshot_port=1500 \
  --udp_incremental_address=0.0.0.0 \
  --udp_incremental_port=1501 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_sub_london.sock \
  > gateway_logs/subscriber_london.log 2>&1 &

nohup roq-udp-publisher \
  --name=udp-publisher \
  --udp_snapshot_address=10.7.94.174 \
  --udp_snapshot_port=1504 \
  --udp_incremental_address=10.7.94.174 \
  --udp_incremental_port=1505 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_pub_hongkong.sock \
  > gateway_logs/publisher_hongkong.log 2>&1 &

# Run roq-udp-subscriber in the background with logging
nohup roq-udp-subscriber \
  --name=udp-subscriber \
  --udp_snapshot_address=0.0.0.0 \
  --udp_snapshot_port=1504 \
  --udp_incremental_address=0.0.0.0 \
  --udp_incremental_port=1505 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_sub_hongkong.sock \
  > gateway_logs/subscriber_hongkong.log 2>&1 &

