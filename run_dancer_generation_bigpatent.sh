#!/bin/bash
CUDA_VISIBLE_DEVICES=6 python src/dancer_generation2.py \
    --mode dancer \
    --model_path dancer_bigpatent_pre/models \
    --output_path dancer_bigpatent_pre \
    --data_path dataset/bigpatent/dancer/test.json \
    --text_column document \
    --summary_column summary \
    --write_rouge 1 \
    --seed 100 \
    --test_batch_size 4 \
    --max_summary_length 128 \
    --max_source_length 4096 \
    --num_beams 5
