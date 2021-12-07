import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trailer/controller/classifier.dart';
import 'package:trailer/controller/classifier_float.dart';
import 'package:logger/logger.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';


class AiController extends GetxController{
  late Classifier _classifier;
  var logger = Logger();

  File? _image;
  final picker = ImagePicker();

  Image? _imageWidget;
  img.Image? fox;
  Map? predResult;



  @override
  void onInit() async {
    super.onInit();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    _image = File(pickedFile!.path);
    _imageWidget = Image.file(_image!);

    _predict();
    update();
  }

  void _predict() async {
    img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    Map _predResult = _classifier.predict(imageInput);

    this.predResult = _predResult;
    update();
  }
}