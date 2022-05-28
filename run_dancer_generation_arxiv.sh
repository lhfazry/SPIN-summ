#!/bin/bash
CUDA_VISIBLE_DEVICES=3 python src/dancer_generation2.py \
    --mode dancer \
    --model_path dancer_arxiv_pre/models \
    --output_path dancer_arxiv_pre \
    --data_path dataset/arxiv/dancer/test.json \
    --text_column document \
    --summary_column summary \
    --write_rouge 0 \
    --seed 100 \
    --test_batch_size 4 \
    --max_summary_length 128 \
    --max_source_length 4096 \
    --num_beams 5
