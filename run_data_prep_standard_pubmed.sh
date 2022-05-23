#!/bin/bash
python src/full_prep.py \
    --data_root dataset/pubmed \
    --task pubmed \
    --strategy standard \
    --partitions 100 --driver_memory 8g
