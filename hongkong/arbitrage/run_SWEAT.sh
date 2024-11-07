#!/usr/bin/env bash
ROQ_v=0 roq-udp-simple \
    --name SWEAT \
    --maker= false \
    --symbol_maker="SWEAT_USDT" \
    --symbol_taker="SWEAT-USDT-SWAP" \
    --exchange_maker="gate-futures" \
    --exchange_taker="okx" \
    --enable_trading=true \
    --spread_high=1.000134 \
    --spread_low=0.993871 \
    --trigger_spread_margin=0.00005 \
    --max_position_taker=5000 \
    --max_position_maker=5000 \
    --maker_quantity=300 \
    --maker_multiplier=100 \
    --taker_multiplier=100 \
    --close_positions=false \
    --taker_min_order_size=1 \
    ~/okx.sock \
    ~/udp_pub_tokyo.sock \
    ~/udp_sub_tokyo.sock \