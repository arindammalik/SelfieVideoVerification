#!/bin/bash
#sh selfieVerification1.sh /home/lavesh/Downloads/user_video.webm /home/lavesh/Downloads/ankit.jpg
source ~/env1/bin/activate
cd /home/lavesh/Desktop/selfie/git/JsSmartMessageSuggestion/BlinkDetector
output=$(python detect_blinks.py --shape-predictor shape_predictor_68_face_landmarks.dat --video $1)
if [ $output -gt 1 ]
then
cd /home/lavesh/Desktop/selfie/git/JsSmartMessageSuggestion/face_recognition/face_recognition
python face_recognition_cli.py --toCompare ../../BlinkDetector/suitableFrame/suitableFrameMin.jpeg --main ../../BlinkDetector/suitableFrame/suitableFrameMax.jpeg
python face_recognition_cli.py --toCompare $2 --main ../../BlinkDetector/suitableFrame/suitableFrameMax.jpeg
else
echo "Blink not detected"
fi
