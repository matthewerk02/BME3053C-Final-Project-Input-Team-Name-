# BME3053C-Final-Project-Input-Team-Name-
Group Members: Matthew Erk, Sydney Irwin, Caleb Leimer, and Alejandro Machado

No Lung Opacity Code:

This code evaluates what sections of the lung are opaque or not. It is used to help physicians determine if lungs that are marked as "not normal" have the potential to be pnemonia or a different respiratory disease. The end result is an overlay of the xray of the lung and a colored in portion of a lung with no opacity; this essentially shows the area of the lung that is healthy. 

Machine Learning:

The model we used for this was squeezenet and alexnet. Squeezenet provided an accuracy of about 70.5% while Alexnet provided an accuracy of about 67.5%.
The learning rate for the squeezenet model was 0.001. The test, valid, and train matrices were all randomized to contain images that were in the folders
of each class that was created. The other code in this file was mostly to either convert images to PNGs to make it easier for other code. This is the
Transfer_to_PNG code. The other code, which sorted the images into three folders based on the class listed in the excel table that came with the data. This
code is called ConvertExcelSheet. The squeezenetStuff code converts the images into the testing, training, and validation matrices and also converts them to
the proper size. It also shows the final graphs that were generated for the report and the powerpoint presentation. Finally the training network was created 
as a result of the squeezenet model.
