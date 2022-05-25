import os
import argparse
import json
import math

def splitter(n, s):
    pieces = s.split()
    return (" ".join(pieces[i:i+n]) for i in range(0, len(pieces), n))

def split_to_part(text, n_parts):
    pieces = text.split()
    step = math.ceil(len(pieces) / n_parts)
    return [" ".join(pieces[i:i+step]) for i in range(0, len(pieces), step)]

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
        print(f"Splitting {prefix} on {data_path}")
        output = []

        with open(data_path, 'r') as fp:
            while (line := fp.readline()):
                row = json.loads(line)
                document = row['document']
                summary = row['summary']
                items = []

                for piece in splitter(4096, document):
                    #piece = piece.strip()

                    item = {
                        "article_id": row['article_id'],
                        "document": piece,
                        #"summary": summaries[id],
                        "text_len": len(piece.split()),
                        #"summary_len": len(summaries[id].split())
                    }

                    items.append(item)

                print(f"Document len: {row['text_len']}, splitted into: {len(items)}")
                summaries = split_to_part(summary, len(items))
                print(f"Summary len: {row['summary_len']}, splitted into: {len(summaries)}")

                for idx, item in enumerate(items):
                    item['summary'] = summaries[idx]
                    item['summary_len'] = len(summaries[idx].split())
                    
                output.extend(items)            

        fname = os.path.join(task_output_dir, f'{prefix}.json')

        with open(fname, 'w') as fp:
            for item in output:
                fp.write(json.dumps(item))
                #json.dump(output, fp, indent=2)

        print(f"Finished writing {prefix} split to {task_output_dir}")


if __name__ == "__main__":
    main()
