# cop507-computer-vision

## Task - Predict Benign & Malignant skin lesions from images
By analyzing features such as shape, colour, and texture in skin lesion images, the system should be able to provide insights about the likelihood of a lesion being cancerous, enabling more accurate and efficient diagnoses by healthcare professionals.

The ABCD (Assymetry, Border, Color, Diameter) approach was applied in determining benign and malignant skin lesions

<img width="1286" alt="Screenshot 2023-07-23 at 08 51 09" src="https://github.com/nnanna217/cop507-computer-vision/assets/1811905/96c074f1-27d2-4243-9f71-605068ec689d">

To run this, run the test.m file.
You can also run also configure the features you would like to train the model with using the functions
in the models/selections folder

To train each feature selection individually and measure their accuracy, use the files in **models/training **folder.

The functions folder contains 
- Feature extraction techniques such as histogram of gradients, colour features (histograms, variance), asymmetric checks, local binary patterns
- Feature selection - PCA was employed in this project
- Pre-processing - techniques such as morphological operators, colour space conversion, and contrast enhancements were applied.


<img width="691" alt="Screenshot 2023-07-23 at 09 15 31" src="https://github.com/nnanna217/cop507-computer-vision/assets/1811905/72eb90af-a8e4-4b7c-bfad-debe9f5c7df9">
<img width="668" alt="Screenshot 2023-07-23 at 09 16 00" src="https://github.com/nnanna217/cop507-computer-vision/assets/1811905/101b210f-685d-4ea6-9302-695baf1649d3">
<img width="669" alt="Screenshot 2023-07-23 at 09 16 40" src="https://github.com/nnanna217/cop507-computer-vision/assets/1811905/d7ad53e9-3b17-429e-a638-114d9f2f4821">


