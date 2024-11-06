#!/bin/bash

# Run roq-gate-futures in the background with logging
nohup roq-gate-futures \
  --name "gate-futures" \
  --config_file gateio_live.toml \
  --client_listen_address ~/gateio.sock \
  --auth_keys_file=keys.json \
  --loop_sleep=0ns \
  --loop_timer_freq=250ns \
  --flagfile ~/opt/conda/envs/deploy/share/roq-gate-futures/flags/prod/flags-usdt.cfg \
  > gateio.log 2>&1 &

# Run roq-udp-publisher in the background with logging
nohup roq-udp-publisher \
  --name=udp-publisher \
  --udp_snapshot_address=10.2.12.198 \
  --udp_snapshot_port=1500 \
  --udp_incremental_address=10.2.12.198 \
  --udp_incremental_port=1501 \
  --config_file=config.toml \
  --auth_keys_file=keys.json \
  --client_listen_address ~/udp_pub_london.sock \
  > publisher_london.log 2>&1 &

# Run roq-udp-subscriber in the background with logging
nohup roq-udp-subscriber \
  --name=udp-subscriber \
  --udp_snapshot_address=0.0.0.0 \
  --udp_snapshot_port=1500 \
  --udp_incremental_address=0.0.0.0 \
  --udp_incremental_port=1501 \
  --config_file=config.toml \
  --auth_keys_file=keys.json \
  --client_listen_address ~/udp_sub_london.sock \
  > subscriber_london.log 2>&1 &

nohup roq-udp-publisher \
  --name=udp-publisher \
  --udp_snapshot_address=10.7.51.88 \
  --udp_snapshot_port=1504 \
  --udp_incremental_address=10.7.51.88 \
  --udp_incremental_port=1505 \
  --config_file=config.toml \
  --auth_keys_file=keys.json \
  --client_listen_address ~/udp_pub_hongkong.sock \
  > publisher_hongkong.log 2>&1 &

# Run roq-udp-subscriber in the background with logging
nohup roq-udp-subscriber \
  --name=udp-subscriber \
  --udp_snapshot_address=0.0.0.0 \
  --udp_snapshot_port=1504 \
  --udp_incremental_address=0.0.0.0 \
  --udp_incremental_port=1505 \
  --config_file=config.toml \
  --auth_keys_file=keys.json \
  --client_listen_address ~/udp_sub_hongkong.sock \
  > subscriber_hongkong.log 2>&1 &

