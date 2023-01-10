*Tested on Ubuntu 18.04.* 

**To reproduce the results please read the README present in the source folder.**

*The [single shot object detector](https://arxiv.org/pdf/1512.02325.pdf) (SSD) implementation used in this project is heavily based on the **[Max deGroot's](https://github.com/amdegroot/ssd.pytorch)** pytorch implementation. 
I strongly recommend to look at his repo*

## Overview: 
FMCG(Fast-Moving Consumer Goods) brands require insights into retail shelves to help them improve their sales. One such insight comes from determining how many products of their brands’ are present versus how many products of competing brands are present on a retail store shelf. This requires finding the total number of products present on every shelf in a retail store.

## Problem statement:
Given a grocery store shelf image, detect all products present in the shelf image (detection only at product or no-product level) with only **one anchor box per feature-map cell**.

## Dataset:
Shelfanalytics Dataset


### What we deliver in this repo:

* **Source code files**:

 data preparation, training and evaluation scripts along with readme and requirements files.

* **image2products.json**:
 <br/>
	{ <br/>
		“shelf_image_name_0”(str): number_of_products(int), <br/>
		“shelf_image_name_1”(str): number_of_products(int), <br/>
		“shelf_image_name_2”(str): number_of_products(int), <br/>
		... <br/>
		“shelf_image_name_n-1”(str): number_of_products(int) <br/>
	}<br/>
A dict containing an entry for every shelf image in the test set with image name as ‘key’ and number of products present in it as ‘value’.

* **metrics.json**:

 mAP, precision and recall computed on test set. 
 <br/>
	{<br/>
		“mAP”(str): 0.5(float),<br/>
		“precision”(str): 0.75(float),<br/>
		“recall”(str): 0.55(float)<br/>
	}<br/>
	
	
* **README.md**: 

Detailed Description of dataset preparation, augmentation(if any), detection network used, training
parameters/hyper-parameters and anchor box tuning.



### Insights in the problem statement: <br/>
* The total numner of bbox in the Ground truth is 2648. <br/>

total numner of bbox in the prediction are:  6397
total number of bbox in the Gtruth are 2648
Number of files in annotations: 71
Number of files in predictions: 71
Unique classes: 1
mAP: 0.731692
{'mAP': 0.731692208626425, 'precision': 0.731692208626425, 'recall': 0.8738670694864048}

**The mAP score is almost same in both the cases but we are reducing around 1000 false positive bboxs in the prediciton.**<br/>


### Dataset preparation steps:
* The dataset for this task is prepared in two steps:
	* First downloading all the required files.
	* Pre-process the data in the required VOC format.
		* Annotated xml file is created in: *source_code/nidhi/VOC2007/Annotatinos*. <br/>
		* Train and test split is created as given for the task:  *source_code/nidhi/VOC2007/ImageSets/Main*. <br/>
		* All the images are put in one folder: *source_code/nidhi/VOC2007/JPEGImages.* <br/>

* Apart from the default data augmentation (normalizing the image, with mean and std), I did not use any augmented data to train the first draft. <br/>

**Detection network used:**
 A standard [SSD]("https://arxiv.org/pdf/1512.02325.pdf") architecture is used in this implementation.

* Default parameters used are as mentioned in the Max deGroot's implentation.

* Total number of classes are 2: one for the product and one for the backgorund class (no product). 

* For the anchor box: As mentioned in the problem statemnt only 1 anchor box per feture map is allowed. we use 6 feture maps (38, 19, 10, 5, 3, 1) as mentioned in the paper with only 1 anchor box each. Additionally the number of default boxes are: 1940 because of the 1 anchor box used for each feature map. We use a fixed ratio (width to height) for the anchor box used i.e.,"0.10:0.12". .


