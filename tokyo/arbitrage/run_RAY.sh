#!/usr/bin/env bash
ROQ_v=0 roq-udp-simple \
    --name RAY \
    --maker=true \
    --symbol_maker="RAY_USDT" \
    --symbol_taker="RAY-USDT-SWAP" \
    --exchange_maker="gate-futures" \
    --exchange_taker="okx" \
    --enable_trading=true \
    --spread_high=1.001766 \
    --spread_low=0.9994 \
    --trigger_spread_margin=0.00005 \
    --max_position_taker=1000 \
    --max_position_maker=10000 \
    --maker_quantity=500 \
    --maker_multiplier=0.1 \
    --taker_multiplier=1 \
    --close_positions=false \
    --taker_min_order_size=1 \
    ~/gateio.sock \
    ~/udp_pub_hongkong.sock \
    ~/udp_sub_hongkong.sock \