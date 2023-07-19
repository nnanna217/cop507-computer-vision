clc;
clear;

A = ABCD_with_jaccard('images/lesionimages/proc/', 'images/masks/proc/');
[cm, order] = svm(A, "groundtruth.txt");
b = multiclass_metrics_common(cm);