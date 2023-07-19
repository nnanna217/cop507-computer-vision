function [cm, order] = svm(imfeatures, groundtruth_file)
    lines = readlines(groundtruth_file);
    groundtruth  = extractAfter(lines,",");
    % groundtruth = groundtruth(1:end-1);
    % perform classification using 10CV
    rng(1); % let's all use the same seed for the random number generator 
    svm = fitcsvm(imfeatures, groundtruth); 
    cvsvm = crossval(svm); 
    pred = kfoldPredict(cvsvm); 
    [cm, order] = confusionmat(groundtruth, pred); 
end