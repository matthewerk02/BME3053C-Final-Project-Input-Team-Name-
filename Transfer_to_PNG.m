file='stage_2_train_images';
output='FullStage2TrainImagesPNG';
%Creates a list of all the files in the folder.
list=dir(fullfile(file,'*.dcm'));
%Finds the size of the list.
size=numel(list);
%Creat cell array with the size of size(variable)x1.
x=cell(size,1);
for y=1:size
    %Finds the current file, converts it to a png, and puts it in the
    %output specifies at the start.
    current=fullfile(file,list(y).name);
    [~,name]=fileparts(current);
    finaloutput=fullfile(output,name+".png");
    x{y}=dicomread(current);
    imwrite(x{y},finaloutput);
end