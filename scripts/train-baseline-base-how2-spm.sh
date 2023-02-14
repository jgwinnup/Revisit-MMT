#!/bin/bash

DATA='data-bin/how2-en-pt-spm/'  
ARCH='transformer_iwslt_de_en'  
SAVE='checkpoints/how2.transformer.en-pt.spm.base'
tgt='pt'

#      --max-tokens 4096 \
CUDA_VISIBLE_DEVICES=0,1 python train.py $DATA --task translation \
      --arch $ARCH --share-all-embeddings --dropout 0.3 \
      --warmup-updates 2000 --lr 0.005 \
      --max-tokens 2048 \
      --max-update 80000 --target-lang $tgt \
      --save-dir $SAVE \
      --keep-interval-updates 10 \
      --find-unused-parameters --patience 10
