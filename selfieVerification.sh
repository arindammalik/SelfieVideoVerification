#!/bin/bash
source /home/ankit/BlinkDetector/bin/activate
cd /home/ankit/JsSmartMessageSuggestion/BlinkDetector
output=$(python detect_blinks.py --shape-predictor shape_predictor_68_face_landmarks.dat --video $1)
if [ $output -gt 1 ]
then
cd /home/ankit/JsSmartMessageSuggestion/face_recognition/face_recognition
python face_recognition_cli.py --toCompare ../../BlinkDetector/suitableFrame/suitableFrameMin.jpeg --main ../../BlinkDetector/suitableFrame/suitableFrameMax.jpeg
python face_recognition_cli.py --toCompare $2 --main ../../BlinkDetector/suitableFrame/suitableFrameMax.jpeg
fi
