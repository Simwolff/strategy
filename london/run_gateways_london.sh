#!/bin/bash

# Run roq-deribit in the background with logging
nohup roq-deribit \
  --name "deribit" \
  --flagfile ~/opt/conda/envs/deploy/share/roq-deribit/flags/prod/flags.cfg \
  --config_file ~/strategy/london/deribit_live.toml \
  --auth_keys_file ~/keys.json \
  --loop_sleep=0ns \
  --loop_timer_freq=250ns \
  --loop_cpu_affinity=0 \
  --client_listen_address ~/sockets/deribit.sock \
  > gateway_logs/deribit.log 2>&1 &

# Run roq-udp-publisher in the background with logging
nohup roq-udp-publisher \
  --name=udp-publisher \
  --udp_snapshot_address=10.8.33.223 \
  --udp_snapshot_port=1500 \
  --udp_incremental_address=10.8.33.223 \
  --udp_incremental_port=1501 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_pub_tokyo.sock \
  > gateway_logs/publisher_tokyo.log 2>&1 &

# Run roq-udp-subscriber in the background with logging
nohup roq-udp-subscriber \
  --name=udp-subscriber \
  --udp_snapshot_address=0.0.0.0 \
  --udp_snapshot_port=1500 \
  --udp_incremental_address=0.0.0.0 \
  --udp_incremental_port=1501 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_sub_tokyo.sock \
  > gateway_logs/subscriber_tokyo.log 2>&1 &

  # Run roq-udp-publisher in the background with logging
nohup roq-udp-publisher \
  --name=udp-publisher \
  --udp_snapshot_address=10.7.94.174 \
  --udp_snapshot_port=1502 \
  --udp_incremental_address=10.7.94.174 \
  --udp_incremental_port=1503 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_pub_hongkong.sock \
  > gateway_logs/publisher_hongkong.log 2>&1 &

# Run roq-udp-subscriber in the background with logging
nohup roq-udp-subscriber \
  --name=udp-subscriber \
  --udp_snapshot_address=0.0.0.0 \
  --udp_snapshot_port=1502 \
  --udp_incremental_address=0.0.0.0 \
  --udp_incremental_port=1503 \
  --config_file=config.toml \
  --auth_keys_file ~/keys.json \
  --client_listen_address ~/sockets/udp_sub_hongkong.sock \
  > gateway_logs/subscriber_hongkong.log 2>&1 &

