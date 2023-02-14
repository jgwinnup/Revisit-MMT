#!/bin/bash

DATA='data-bin/how2-en-pt-spm/'  # input data
ARCH='gated_tiny'  # model structure
SAVE='checkpoints/how2-diffusion.resnext101_32x8d_avgpool.gated.en-pt.tiny'  # save dir
FEATURE='features/how2-diffusion.resnext101_32x8d-avgpool.npy'  # path to visual features
tgt='pt'

python train.py $DATA --task mmt \
      --arch $ARCH --share-all-embeddings --dropout 0.3 \
      --warmup-updates 2000 --lr 0.005 \
      --max-tokens 4096 \
      --max-update 50000 --target-lang $tgt \
      --save-dir $SAVE \
      --keep-interval-updates 10 \
      --visual_feature_file $FEATURE \
      --find-unused-parameters --patience 10 
