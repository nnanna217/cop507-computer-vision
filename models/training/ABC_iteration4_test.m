clc;
clear;

A = ABC_iteration4('images/lesionimages/proc/', 'images/masks/proc/');
[cm, order] = svm(A, "groundtruth.txt");
b = multiclass_metrics_common(cm);
