#!/bin/bash
CUDA_VISIBLE_DEVICES=3 python src/run_summarization.py \
    --model_name_or_path google/bigbird-pegasus-large-bigpatent --tokenizer_name google/bigbird-pegasus-large-bigpatent \
    --do_train \
    --do_eval \
    --task summarization \
    --train_file dataset/pubmed/standard/pubmed/train.json \
    --validation_file dataset/pubmed/standard/pubmed/val.json \
    --text_column document \
    --summary_column summary \
    --output_dir standard_pubmed_pre/models --logging_dir standard_pubmed_pre/models/logs \
    --seed 100 \
    --per_device_train_batch_size=8 \
    --per_device_eval_batch_size=8 \
    --overwrite_output_dir \
    --predict_with_generate \
    --max_val_samples 17 \
    --learning_rate 1e-4 \
    --adafactor \
    --max_source_length 512 --max_target_length 128 --val_max_target_length 128 --pad_to_max_length \
    --num_beams 3 \
    --num_train_epochs 2 --save_strategy epoch --save_total_limit 1 \
    --load_best_model_at_end \
    --evaluation_strategy epoch --metric_for_best_model rouge2 --greater_is_better true
