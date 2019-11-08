import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fh2019/core/models/item.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_text_styles.dart';

import 'package:fh2019/ui/widgets/footer_button.dart';

import 'face_painter.dart';

class ImageCapturePage extends StatefulWidget {
  @override
  _ImageCapturePageState createState() => _ImageCapturePageState();
}

class _ImageCapturePageState extends State<ImageCapturePage> {
  File _imageFile;
  List<Face> _faces = [];
  bool isLoading = false;
  ui.Image _image;
  double _smilingProbability = 0.0;
  Emotion _emotion = Emotion.HAPPY;

  _getImageAndDetectFaces() async {
    final capturedImage =
        await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      isLoading = true;
    });
    final image = FirebaseVisionImage.fromFile(capturedImage);
    final faceDetector = FirebaseVision.instance
        .faceDetector(FaceDetectorOptions(enableClassification: true));
    List<Face> faces = await faceDetector.processImage(image);

    for (var face in faces) {
      // If classification was enabled with FaceDetectorOptions:
      if (face.smilingProbability != null) {
        _smilingProbability = face.smilingProbability;
      }
    }
    if (mounted) {
      setState(() {
        _imageFile = capturedImage;
        _faces = faces;
        _loadImage(capturedImage);
      });
    }
  }

  _loadImage(File file) async {
    final data = await file.readAsBytes();
    await decodeImageFromList(data).then(
      (value) => setState(() {
        _image = value;
        isLoading = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : (_imageFile == null)
                    ? Center(
                        child: Text(
                        'Look at the camera then press the capture button.',
                        style: CustomTextStyle.body2,
                      ))
                    : Center(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: FittedBox(
                                  child: SizedBox(
                                    width: _image.width.toDouble(),
                                    height: _image.height.toDouble(),
                                    child: CustomPaint(
                                      painter: FacePainter(_image, _faces),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (_faces.length > 0)
                                    ? Text(
                                        "Smiling probability = $_smilingProbability")
                                    : Container(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (_faces.length > 0)
                                    ? _emotionEquivalent(_smilingProbability)
                                    : Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: new FooterButton(
                      title: _faces.length > 0 ? "Cancel" : "Back",
                      color: CustomColors.red,
                      func: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: new FooterButton(
                      color: isLoading ? Colors.grey : CustomColors.blue,
                      title: _image == null ? "Capture" : "Recapture",
                      func: () {
                        if (!isLoading) _getImageAndDetectFaces();
                      },
                    ),
                  ),
                ),
                _faces.length > 0
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: new FooterButton(
                            color: CustomColors.green,
                            title: "Proceed",
                            func: () {
                              Navigator.pop(context, _emotion);
                            },
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _emotionEquivalent(double smilingProbability) {
    if (smilingProbability >= 0.60) {
      _emotion = Emotion.HAPPY;
      return Text(
        "Happy",
        style: TextStyle(color: Colors.green),
      );
    } else if (smilingProbability < 0.60 && smilingProbability >= 0.40) {
      _emotion = Emotion.NORMAL;
      return Text(
        "Normal",
        style: TextStyle(color: Colors.blue),
      );
    } else {
      _emotion = Emotion.SAD;
      return Text("Sad", style: TextStyle(color: Colors.red));
    }
  }
}
