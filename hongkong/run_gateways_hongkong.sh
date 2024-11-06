#!/bin/bash

# Run roq-deribit in the background with logging
nohup roq-okx \
  --name "okx" \
  --flagfile ~/opt/conda/envs/deploy/share/roq-okx/flags/prod/flags.cfg \
  --config_file ~/strategy/hongkong/okx_live.toml \
  --loop_sleep=0ns \
  --loop_timer_freq=250ns \
  --ws_books_depth=50 \
  --client_listen_address ~/sockets/okx.sock \
  --auth_keys_file ~/keys.json \
  > gateway_logs/okx.log 2>&1 &

# Run roq-udp-publisher in the background with logging
nohup roq-udp-publisher \
  --name=udp-publisher \
  --udp_snapshot_address=10.2.12.198 \
  --udp_snapshot_port=1502 \
  --udp_incremental_address=10.2.12.198 \
  --udp_incremental_port=1503 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_pub_london.sock \
  > gateway_logs/publisher_london.log 2>&1 &

# Run roq-udp-subscriber in the background with logging
nohup roq-udp-subscriber \
  --name=udp-subscriber \
  --udp_snapshot_address=0.0.0.0 \
  --udp_snapshot_port=1502 \
  --udp_incremental_address=0.0.0.0 \
  --udp_incremental_port=1503 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_sub_london.sock \
  > gateway_logs/subscriber_london.log 2>&1 &

# Run roq-udp-publisher in the background with logging
nohup roq-udp-publisher \
  --name=udp-publisher \
  --udp_snapshot_address=10.8.21.187 \
  --udp_snapshot_port=1504 \
  --udp_incremental_address=10.8.21.187 \
  --udp_incremental_port=1505 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_pub_tokyo.sock \
  > gateways_logs/publisher_tokyo.log 2>&1 &

# Run roq-udp-subscriber in the background with logging
nohup roq-udp-subscriber \
  --name=udp-subscriber \
  --udp_snapshot_address=0.0.0.0 \
  --udp_snapshot_port=1504 \
  --udp_incremental_address=0.0.0.0 \
  --udp_incremental_port=1505 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_sub_tokyo.sock \
  > gateway_logs/subscriber_tokyo.log 2>&1 &
