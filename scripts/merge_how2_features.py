#!/usr/bin/env python

# Merge precomputed how2 resnext-101 action features
# by vertically concatenating arrays

import argparse                                                                                                                                           
import sys  

import numpy as np

prog = 'merge_how2_features'                                                                                                                                    
__version__ = "0.0.1"    

if __name__ == "__main__":                                                                                                                                
                                                                                                                                                          
    parser = argparse.ArgumentParser(prog=prog)                                                                                                           
    parser.add_argument("--version", action='version', version='%(prog)s ' + __version__)
    parser.add_argument("--inputs", help="comma separated list of numpy array files") 
    parser.add_argument("--output", help="merged output array file")

    args = parser.parse_args()      

    inputs = []
    input_names = args.inputs.split(",")
   
    for inp in input_names:

        i = np.load(inp)

        print(f'{inp}: {i.shape}')

        inputs.append(i)

    print(f'Merging {len(inputs)} arrays.')

    out = np.vstack(inputs)

    print(f'Output: {out.shape}')

    np.save(args.output, out)
    
