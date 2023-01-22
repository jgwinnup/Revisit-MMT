#!/bin/bash

DATA='data-bin/how2-en-pt-spm/'  # input data
ARCH='gated_tiny'  # model structure
SAVE='checkpoints/how2.diffusion.gated.en-pt.tiny'  # save dir
FEATURE='features/pool-how2-diffusion.resnet50-avgpool.npy'  # path to visual features
tgt='pt'

CUDA_VISIBLE_DEVICES=2,3 python train.py $DATA --task mmt \
      --arch $ARCH --share-all-embeddings --dropout 0.3 \
      --warmup-updates 2000 --lr 0.005 \
      --max-tokens 4096 \
      --max-update 50000 --target-lang $tgt \
      --save-dir $SAVE \
      --visual_feature_file $FEATURE \
      --find-unused-parameters --patience 10 
