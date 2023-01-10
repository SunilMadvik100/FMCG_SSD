#!/bin/bash

python3 data_prep.py


#Run this command to fine tune the model

##python3 -W ignore train.py --dataset_root Dataset/FMCG_SI/ --batch_size 16 --lr 0.000001 --resume weights/vgg16_reducedfc.pth

#python3 -W ignore train.py --dataset_root Dataset/FMCG_SI/ --batch_size 16 --lr 0.000001 --resume weights/FMCG_ssd_10000.pth

python3 -W ignore eval.py --voc_root Dataset/FMCG_SI/  --cuda False --trained_model weights/FMCG_ssd_10000.pth

python3 post_process.py
 
