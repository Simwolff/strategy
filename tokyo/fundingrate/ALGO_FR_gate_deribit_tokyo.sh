#!/usr/bin/env bash
ROQ_v=0 roq-udp-fundingrate \
    --name ALGO_FR \
    --maker=true \
    --enable_trading=true \
    --symbol_taker="ALGO_USDC-PERPETUAL" \
    --symbol_maker="ALGO_USDT" \
    --exchange_maker="gate-futures" \
    --exchange_taker="deribit" \
    --maker_side="BUY" \
    --taker_side="SELL" \
    --maker_quantity=100 \
    --maker_multiplier=10 \
    --taker_multiplier=10 \
    --max_position_maker=16000 \
    --max_position_taker=16000 \
    --taker_min_order_size=1 \
    --open_positions=false \
    --price_check=true \
    --tick_spread=0.0001 \
    ~/gateio.sock \
    ~/udp_pub_london.sock \
    ~/udp_sub_london.sock \
