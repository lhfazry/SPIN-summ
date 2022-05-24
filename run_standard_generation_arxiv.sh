#!/bin/bash
CUDA_VISIBLE_DEVICES=3  python src/dancer_generation.py \
    --mode standard \
    --model_path standard_arxiv_pre/models \
    --output_path standard_arxiv_pre/generation \
    --data_path dataset/arxiv/standard/arxiv/test.json \
    --text_column document \
    --summary_column summary \
    --write_rouge 1 \
    --seed 100 \
    --test_batch_size 8 \
    --max_source_length 1024 --max_summary_length 256 \
    --num_beams 5