data = fullfile('C:\Users\matth\Documents\BME3053CFinalProject\rsna-pneumonia-detection-challenge\ClassFolders');
images = imageDatastore(data,'IncludeSubFolders',true,'LabelSource','foldernames');
[train, val, test] = splitEachLabel(images, 0.7,0.1,0.2, 'randomized');
ImageSize=[227 227 3];
newtrain=augmentedImageDatastore(ImageSize,train,'ColorPreprocessing','gray2rgb');
newval=augmentedImageDatastore(ImageSize,val,'ColorPreprocessing','gray2rgb');
newtest=augmentedImageDatastore(ImageSize,test,'ColorPreprocessing','gray2rgb');

load trainedNetwork_1.mat;

prediction=classify(trainedNetwork_1,newtest);
validation=test.Labels;
accuracy=sum(prediction==validation)/numel(validation);

x=randi(numel(test.Labels),1,10);
figure(1);
for y=1:length(x)
    subplot(5,2,y);
    image=readimage(test,x(y));
    label=prediction(x(y));
    if label == 'Stage2LungOpacity'
        label='Lung Opacity';
    elseif label == 'Stage2Normal'
        label='Normal';
    elseif label == 'Stage2NoLungOpacity'
        label='No Lung Opacity';
    end
    imshow(image);
    title(label);
end

figure(2);
confusionchart(validation,prediction,'RowSummary','row-normalized','ColumnSummary','column-normalized','Title','Accuracy on test set: ' + string(accuracy));