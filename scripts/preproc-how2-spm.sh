#!/bin/bash

src=en
tgt=pt

TEXT=data/how2-$src-$tgt-spm/

python preprocess.py --source-lang $src --target-lang $tgt \
  --trainpref $TEXT/train \
  --validpref $TEXT/val \
  --testpref $TEXT/test \
  --destdir data-bin/how2-$src-$tgt-spm \
  --workers 8 --joined-dictionary
