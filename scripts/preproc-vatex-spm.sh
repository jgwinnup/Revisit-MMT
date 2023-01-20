#!/bin/bash

src=zh
tgt=en

TEXT=data/vatex-$src-$tgt/

python preprocess.py --source-lang $src --target-lang $tgt \
  --trainpref $TEXT/train.spm \
  --validpref $TEXT/val.spm \
  --testpref $TEXT/test.spm \
  --destdir data-bin/vatex-$src-$tgt-spm \
  --workers 8 --joined-dictionary
