#!/bin/bash
CUDA_VISIBLE_DEVICES=1 python src/spin_generation.py \
    --mode spin \
    --model_path spin_bigpatent/sc3/models \
    --output_path spin_bigpatent/sc3 \
    --data_path dataset/bigpatent/dancer/test.json \
    --text_column document \
    --summary_column abstract \
    --write_rouge 0 \
    --seed 100 \
    --test_batch_size 4 \
    --max_summary_length 256 \
    --max_source_length 4096 \
    --num_beams 5
