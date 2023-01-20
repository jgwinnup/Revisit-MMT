#!/usr/bin/env python

# Remap train, valid, test dataset splits to common numbering for
# resnet pooled feature processing

import argparse
import sys
import os
import glob

from natsort import natsorted

prog = 'remap_dataset'
__version__ = "0.0.1"

if __name__ == "__main__":

    parser = argparse.ArgumentParser(prog=prog)
    parser.add_argument("--version", action='version', version='%(prog)s ' + __version__)
    parser.add_argument("--dirs", help="comma separated list of image directories")
    parser.add_argument("--outdir", default="pool", help="output directory")
    parser.add_argument("--ext", default="png", help="image extension")
    
    args = parser.parse_args()
    
    ctr = 1 

    # check if output dir exists, exit if present
    if os.path.exists(args.outdir):
        sys.stderr.write(f'Output directory {args.outdir} exists - exiting!\n')

    dirs = args.dirs.split(',')
    sys.stderr.write(f'Working on directories: {dirs}\n')
    
    os.mkdir(args.outdir)


    with open(f'{args.outdir}/index.txt', 'w') as master:
        # for each directory 
        for dir in dirs:

            with open(f'{args.outdir}/{dir}.index.txt', 'w') as index:
                
                # get glob of media files from directory
                media = natsorted(glob.glob(f'{dir}/*.{args.ext}'))

                for m in media:

                    link = f'{args.outdir}/{ctr}.{args.ext}'

                    # Should use this to log mapping for diagnosis...
                    # print(f'{dir} {ctr} {m} {link}')

                    os.symlink(f'../{m}', link)

                    master.write(f'{ctr}.{args.ext}\n')
                    index.write(f'{ctr}\n')
                    ctr += 1

                    

