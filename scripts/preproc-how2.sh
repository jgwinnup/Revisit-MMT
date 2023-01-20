#!/bin/bash

src=en
tgt=pt

TEXT=data/how2-$src-$tgt/

python preprocess.py --source-lang $src --target-lang $tgt \
  --trainpref $TEXT/train \
  --validpref $TEXT/val \
  --testpref $TEXT/test \
  --destdir data-bin/how2-$src-$tgt \
  --workers 8 --joined-dictionary
