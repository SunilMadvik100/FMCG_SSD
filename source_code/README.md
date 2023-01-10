## **Use cuda 10.1**
### To create and activate the conda environment.
  * conda env create -f environment.yml
  * conda activate ssd

*Run the "run.sh" bash script to do all the steps (bash run.sh).*

### Data preparation step. 
  *Download and pre-process the data required for training and testing:
    * python data_prep.py

### Training command, if do not want to fine-tune the model remove the --resume argument.
  * python3 -W ignore train.py --dataset_root Dataset/FMCG_SI/ --batch_size 16 --lr 0.000001 --resume weights/vgg16_reducedfc.pth
    [ If you are start training with initial weights vgg16_reducedfc.pth ][ change batch_size -32 based on GPU ]
    [ use self.vgg.load_state_dict in line 124 in ssd.py]

  * python3 -W ignore train.py --dataset_root Dataset/FMCG_SI/ --batch_size 16 --lr 0.000001 --resume weights/FMCG_ssd_10000.pth
    [ If you are start training with initial weights FMCG_ssd_10000.pth ][ change batch_size -32 based on GPU ]
    [use self.load_state_dict in line 122 in ssd.py]

### Evaluatino script to save the predicted bbox's
  * python3 -W ignore eval.py --voc_root Dataset/FMCG_SI/  --cuda False --trained_model weights/FMCG_ssd_10000.pth

### Post processig step to caclulate the mAp, precision, and recall. Also it saves the number of products in each image.
  * python3 post_process.py


