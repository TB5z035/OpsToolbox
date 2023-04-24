

import os
import argparse
from tqdm import tqdm

def create(root_dir, target_dir, hard_link=False):
    os.makedirs(target_dir, exist_ok=True)
    link = os.link if hard_link else os.symlink
    walk = [x for x in os.walk(root_dir)]
    for root, dirs, files in tqdm(walk):
        relpath = os.path.relpath(root, root_dir)
        os.makedirs(os.path.join(target_dir, relpath), exist_ok=True)
        for file in files:
            if os.path.islink(os.path.join(target_dir, relpath, file)):
                os.remove(os.path.join(target_dir, relpath, file))
            elif os.path.isfile(os.path.join(target_dir, relpath, file)):
                raise RuntimeError(f'File exists: {os.path.join(target_dir, relpath, file)}')
            elif os.path.isdir(os.path.join(target_dir, relpath, file)):
                raise RuntimeError(f'Directory exists: {os.path.join(target_dir, relpath, file)}')
            link(os.path.realpath(os.path.join(root, file)), os.path.join(target_dir, relpath, file))

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('root_dir')
    parser.add_argument('target_dir')
    parser.add_argument('--hard_link', action='store_true')
    args = parser.parse_args()
    create(args.root_dir, args.target_dir, args.hard_link)