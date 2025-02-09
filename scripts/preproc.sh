#!/bin/bash

tgt=de

TEXT=data/multi30k-en-$tgt/

python preprocess.py --source-lang en --target-lang $tgt \
  --trainpref $TEXT/train \
  --validpref $TEXT/valid \
  --testpref $TEXT/test.2016,$TEXT/test.2017,$TEXT/test.coco \
  --destdir data-bin/multi30k.en-$tgt \
  --workers 8 --joined-dictionary
