clc;
clear;

features = B_features('images/lesionimages/proc/', 'images/masks/proc/');
[cm, order] = svm(features, "groundtruth.txt");
b = multiclass_metrics_common(cm);

% Extract TP, FP, TN, and FN from confusion matrix
TP = cm(1,1);
FP = cm(2,1);
TN = cm(2,2);
FN = cm(1,2);

% Calculate sensitivity and specificity
accuracy = b.Accuracy;
sensitivity = TP / (TP + FN);
specificity = TN / (TN + FP);
