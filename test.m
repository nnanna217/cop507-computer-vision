clc;
clear;

features = ABCD_with_glcm_hog('images/lesionimages/proc/', 'images/masks/proc/');
lines = readlines("groundtruth.txt");
groundtruth  = extractAfter(lines,",");

% Split data into training and test sets
cv = cvpartition(groundtruth ,'HoldOut',0.2);
Xtrain = features(cv.training,:);
ytrain = groundtruth (cv.training);
Xtest = features(cv.test,:);
ytest = groundtruth (cv.test);


% perform classification using 10CV
rng(1); % let's all use the same seed for the random number generator 
svm = fitcsvm(Xtrain, ytrain); 
cvsvm = crossval(svm, 'kfold', 10); 
pred = kfoldPredict(cvsvm); 
cm = confusionmat(ytrain, pred); 

% Predict labels of test set
ypred = predict(svm,Xtest);

% Extract TP, FP, TN, and FN from confusion matrix
TP = cm(1,1);
FP = cm(2,1);
TN = cm(2,2);
FN = cm(1,2);

% Calculate sensitivity and specificity
accuracy = sum(diag(cm))/sum(cm(:));
sensitivity = TP / (TP + FN);
specificity = TN / (TN + FP);

% Compute confusion matrix and accuracy
C = confusionmat(ytest,ypred);
accuracy_test = sum(diag(C))/sum(C(:));

% Plot confusion matrix
figure
confusionchart(C, {'Benign', 'Malignant'})
title(['Confusion Matrix (Accuracy = ' num2str(accuracy_test*100) '%)']);