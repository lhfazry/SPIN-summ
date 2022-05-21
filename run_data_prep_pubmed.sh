#!/bin/bash
python src/full_prep.py \
    --data_root dataset/pubmed \
    --task pubmed \
    --partitions 500 --driver_memory 8g
