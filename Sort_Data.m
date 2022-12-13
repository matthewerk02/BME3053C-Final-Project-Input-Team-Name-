
%extracting labels from each of the training sample files
Data = readtable("stage_2_detailed_class_info.csv");

%Setting variables for next step
no_opacity = 0;
normal = 0;
opacity = 0;


%Counting how many patients fall into each label 
for ii = 1:1:size(Data)
    if string(Data.class(ii)) == "No Lung Opacity / Not Normal"
        no_opacity = no_opacity + 1;
    elseif string(Data.class(ii)) == "Normal"
        normal = normal + 1;
    elseif string(Data.class(ii)) == "Lung Opacity"
        opacity = opacity + 1;
    end
end



