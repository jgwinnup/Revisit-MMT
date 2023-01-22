#!/bin/bash

DATA='data-bin/vatex-zh-en-spm/'  # input data
ARCH='gated_tiny'  # model structure
SAVE='checkpoints/vatex.gated.zh-en.tiny'  # save dir
FEATURE='features/pool-vatex-diffusion.resnet50-avgpool.npy'  # path to visual features
tgt='en'

CUDA_VISIBLE_DEVICES=2,3 python train.py $DATA --task mmt \
      --arch $ARCH --share-all-embeddings --dropout 0.3 \
      --warmup-updates 2000 --lr 0.005 \
      --max-tokens 4096 \
      --max-update 80000 --target-lang $tgt \
      --save-dir $SAVE \
      --visual_feature_file $FEATURE \
      --find-unused-parameters --patience 10 
