# SelfieVideoVerification

# Detection of Fraudulent listings using fake photos

## Problem 🌍 
With benefits of social media we also face drawback of it on daily basis. We are more prone to fall victim to spam users today than ever before. Spam user can use fake photos of someone else to fool people. This decreases overall confidence of the social media platform. 

## Solution
For this I designed simple online video verification back in 2019 and am sharing it. We can prevent fradulent users by asking people to verify themselves against the photo they have uploaded. 
In verification phase we capture real-time video of user and focus on detecting whether video is genuine and the person in the video matches the person of which photos are uploaded in the account. 

The project in divided into 3 phase:
1. Video Recording
    Capturing video instead of a photo to detect motion
    Capturing on web interface through Stream Recording 
2. Motion Detection
    Asking User to blink in the video.
    Detecting blink to know if its a moving user not a picture.
    Used change of  Aspect ratio of eyes to detect blink
3. Face Matching
    Comparison of frames and uploaded images
    OpenCv and dlib libraries to extract facial landmarks 
    Finding Similarity between images

## Blink Detection
Fetch Frames from video. Detect change in aspect ratio using the following formula. The lowering of aspect ratio and then rising indicates a blink.

Lets say our eye points are as shown in image below:


![pageres](eyeAspectRatio.jpg "eyeAspectRatio")

The our formula turns out to be


<img src="https://latex.codecogs.com/svg.latex?\Large&space;AspectRatio=\frac{(x6-x2)+(x5-x3)}{2(x4-x1)}" title="\Large AspectRatio=\frac{(x6-x2)+(x5-x3)}{2(x4-x1)}" />

We can also see when a person blinks how aspect ratio dips


![pageres](AspectRatio_FrameRate.jpg "AspectRatio_FrameRate")



## Face Matching

Image to intensity binary map (Gradient)


![pageres](Matching1.png "Matching1")

Gradient Deviation to find uniqueness


Face Detection to extract facial landmark
![pageres](landmarksFace1.png "landmarksFace1")

Aligning face and finding similarity between gradient deviation of two images
![pageres](faceMatchingHog.png "faceMatchingHog")
