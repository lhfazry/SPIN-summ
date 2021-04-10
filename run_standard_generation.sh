python src/dancer_generation.py \
    --mode standard \
    --model_path pegasus_pubmed/models \
    --dataset_name scientific_papers --dataset_config_name pubmed\
    --max_test_samples 100 \
    --text_column article \
    --summary_column abstract \
    --seed 100 \
    --test_batch_size 4 \
    --max_source_length 512 --max_summary_length 128 \
    --num_beams 5
