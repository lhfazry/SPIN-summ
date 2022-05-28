#!/bin/bash
CUDA_VISIBLE_DEVICES=3  python src/dancer_generation2.py \
    --mode standard \
    --model_path standard_arxiv_pre/models \
    --output_path standard_arxiv_pre \
    --data_path dataset/arxiv/test.json \
    --text_column document \
    --summary_column summary \
    --write_rouge 0 \
    --seed 100 \
    --test_batch_size 4 \
    --max_source_length 4096 \
    --num_beams 5