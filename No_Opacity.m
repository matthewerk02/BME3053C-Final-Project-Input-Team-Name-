function [I,BWfinal,Overlay] = No_Opacity(image_name)
    I = dicomread(image_name); %reads the image name input

    contrast = imadjust(I); %increase contrast of image
    Inverse_I = 255 - contrast; %inverse color to make the brightest things black
    Inverse_I = imclearborder(Inverse_I); %smoothens

    Lung = 255 - Inverse_I; %Highlights everything but lungs
    Lung(Lung > 240) = 0; %Anything past a certain brightness becomes 0

    BW = imbinarize(Lung); %making a completely black and white image

    %filling in all gaps in lungs
    seD = strel('diamond',15); 
    BWdil = imdilate(BW, seD);
    BWdil = imfill(BWdil, 'holes');

    %eroding image to get rid of all the "noise"
    seD = strel('diamond',15);  
    BWerode=imerode(BWdil,seD);
    BWerode=imerode(BWerode,seD);

    BWfinal = imdilate(BWerode, seD); %bringing lungs back to original size
    seC = strel('disk',3); %smoothing out edges
    BWfinal = imdilate(BWfinal, seC);

    Overlay = labeloverlay(I,BWfinal);

    subplot(1,3,1); %plotting original, isolated, and areas with no lung opacity for comparisons
        imshow(I);
        title("Original image");
    subplot(1,3,2);
        imshow(BWfinal);
        title("Isolated lungs");
    subplot(1,3,3);
        plot(Overlay);
        title("Areas with no lung opacity");
end