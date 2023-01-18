#!/bin/bash

DATA='data-bin/multi30k.en-de/'  # input data
ARCH='gated_tiny'  # model structure
SAVE='checkpoints/gated.en-de.tiny'  # save dir
FEATURE=xxxxx  # path to visual features you downloaded
tgt='de'

CUDA_VISIBLE_DEVICES=0,1 python train.py $DATA --task mmt \
      --arch $ARCH --share-all-embeddings --dropout 0.3 \
      --warmup-updates 2000 --lr 0.005 \
      --max-tokens 4096 \
      --max-update 8000 --target-lang $tgt \
      --save-dir $SAVE \
      --visual_feature_file $FEATURE \
      --find-unused-parameters --patience 10 
```
