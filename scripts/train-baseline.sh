#!/bin/bash

DATA='data-bin/multi30k.en-de/'  
ARCH='transformer_tiny'  
SAVE='checkpoints/transformer.en-de.tiny'
tgt='de'

CUDA_VISIBLE_DEVICES=0,1 python train.py $DATA --task translation \
      --arch $ARCH --share-all-embeddings --dropout 0.3 \
      --warmup-updates 2000 --lr 0.005 \
      --max-tokens 4096 \
      --max-update 8000 --target-lang $tgt \
      --save-dir $SAVE \
      --find-unused-parameters --patience 10 
