%Store the folder as a variable
data=fullfile('C:\Users\matth\Documents\BME3053CFinalProject\FullStage2TrainImagesPNG');
%Make a table that contains the value from the spreadsheet.
table=readtable('stage_2_detailed_class_info.xlsx');
%Shrink the table to get rid of any repeat in file names.
table=unique(table);
%Make a list of all the files in the data and remove png.
list=dir(fullfile(data,'*.png'));
for x=1:length(list)
    %Store the name of the current file.
    currentfile=list(x).name;
    %Erase the .png.
    currentfile=erase(currentfile,'.png');
    %Find the row of the current file.
    row=find(strcmpi(currentfile,table.patientId));
    %Find the value in column two which stats whether it has lung opacity,
    %no lung opacity, or is normal.
    class=char(table{row,2});
    %The difference between the values in seen in the first three
    %characters.
    firstthree=class(1:3);
    %In this if statement, it checks what the first three characters are
    %and then copies whatever file it is working on to the folder that
    %corresponds with the class.
    if  firstthree== 'No '
        destination='C:\Users\matth\Documents\BME3053CFinalProject\rsna-pneumonia-detection-challenge\Stage2NoLungOpacity';
        filename=strcat(currentfile,'.png');
        source=strcat('C:\Users\matth\Documents\BME3053CFinalProject\rsna-pneumonia-detection-challenge\FullStage2TrainImagesPNG\',filename);
        copyfile(source,destination);
    elseif firstthree == 'Nor'
        destination='C:\Users\matth\Documents\BME3053CFinalProject\rsna-pneumonia-detection-challenge\Stage2Normal';
        filename=strcat(currentfile,'.png');
        source=strcat('C:\Users\matth\Documents\BME3053CFinalProject\rsna-pneumonia-detection-challenge\FullStage2TrainImagesPNG\',filename);
        copyfile(source,destination);
    elseif firstthree == 'Lun'
        destination='C:\Users\matth\Documents\BME3053CFinalProject\rsna-pneumonia-detection-challenge\Stage2LungOpacity';
        filename=strcat(currentfile,'.png');
        source=strcat('C:\Users\matth\Documents\BME3053CFinalProject\rsna-pneumonia-detection-challenge\FullStage2TrainImagesPNG\',filename);
        copyfile(source,destination);
    end
end



    