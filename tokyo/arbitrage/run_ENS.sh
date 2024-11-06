#!/usr/bin/env bash
ROQ_v=0 roq-udp-simple \
    --name ENS \
    --maker=true \
    --symbol_maker="ENS_USDT" \
    --symbol_taker="ENS-USDT-SWAP" \
    --exchange_maker="gate-futures" \
    --exchange_taker="okx" \
    --enable_trading=true \
    --spread_high=1.0002 \
    --spread_low=0.998947 \
    --trigger_spread_margin=0.00005 \
    --max_position_taker=5000 \
    --max_position_maker=5000 \
    --maker_quantity=100 \
    --maker_multiplier=0.1 \
    --taker_multiplier=0.1 \
    --close_positions=false \
    --taker_min_order_size=1 \
    ~/gateio.sock \
    ~/udp_pub_hongkong.sock \
    ~/udp_sub_hongkong.sock \