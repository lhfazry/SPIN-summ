import os
import argparse

import json
import pyspark
from pyspark.sql import functions as F
from pyspark.sql import types as spark_types

from rouge_score import rouge_scorer

def splitter(n, s):
    pieces = s.split()
    return (" ".join(pieces[i:i+n]) for i in range(0, len(pieces), n))

def split_to_part(text, n_parts):
    return [text[i:i+n_parts] for i in range(0, len(text), n_parts)]

def read_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data_root", type=str, help="")

    args, unknown = parser.parse_known_args()
    return args, unknown


def main():
    args, unknown = read_args()

    train_data = os.path.join(args.data_root, 'train.json')
    val_data = os.path.join(args.data_root, 'val.json')
    test_data = os.path.join(args.data_root, 'test.json')

    data_prefixes = ['train', 'val', 'test']
    data_paths = [train_data, val_data, test_data]

    task_output_dir = os.path.join(args.data_root, 'dancer')

    if not os.path.exists(task_output_dir):
        os.makedirs(task_output_dir)

    for data_path, prefix in zip(data_paths, data_prefixes):
        output = []
        rows = json.loads(data_path)

        for row in rows:
            document = row['document']
            summary = row['summary']

            documents = splitter(4096, document)
            summaries = split_to_part(summary, len(documents))

            for id, piece in enumerate(documents):
                item = {
                    "article_id": row['article_id'],
                    "document": piece,
                    "summary": summaries[id],
                    "text_len": len(piece.split()),
                    "summary_len": len(summaries[id].split())
                }

                output.append(item)

        fname = os.path.join(task_output_dir, f'{prefix}.json')

        with open(fname, 'w') as fp:
            json.dump(output, fp, indent=2)

        print(f"Finished writing {prefix} split to {task_output_dir}")


if __name__ == "__main__":
    main()
