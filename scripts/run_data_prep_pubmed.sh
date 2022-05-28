#!/bin/bash
python src/full_prep.py \
    --data_root dataset/pubmed \
    --task pubmed \
    --strategy dancer \
    --partitions 100 --driver_memory 8g
