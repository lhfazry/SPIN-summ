#!/bin/bash
CUDA_VISIBLE_DEVICES=3  python src/dancer_generation.py \
    --mode standard \
    --model_path standard_bigpatent_pre/models \
    --output_path standard_bigpatent_pre \
    --data_path dataset/bigpatent/test.json \
    --text_column document \
    --summary_column summary \
    --write_rouge 1 \
    --seed 100 \
    --test_batch_size 8 \
    --max_source_length 4096 \
    --test_batch_size 4 \
    --num_beams 5