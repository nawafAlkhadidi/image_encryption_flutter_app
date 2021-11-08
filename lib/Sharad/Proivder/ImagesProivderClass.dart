// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as imgl;
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'package:image_encryption/Process/EncryptDecrypt.dart';

class ImagesProvider extends ChangeNotifier {
  // Encrypt or Decrypt
  String typeOfAction = '';
  // image plain
  String imagePlainPath = 'null';
  int imagePlainSize = 0;
  // image key
  String imageKeyPath = 'null';
  int imageKeySize = 0;
  String tempPath = 'null';

  bool isLoading = false;

  // picks
  final ImagePicker _picker = ImagePicker(); //lib pack

  // plain or key
  Future<void> pickImage(String action, ImageSource source) async {
    XFile image = await _picker.pickImage(source: source);

    if (action == 'plain') {
      try {
        setImagePlainPath(image.path);
        setImagePlainSize(await image.length());
      } catch (error) {
        print('This user has not uploaded the plain image + $error');
      }
    } else {
      try {
        setImageKeyPath(image.path);
        setImageKeySize(await image.length());
      } catch (error) {
        print('This user has not uploaded the kay image $error ');
      }
    }
  }

  String get gettypeOfAction {
    return typeOfAction;
  }

  setTypeOfAction(String type) {
    typeOfAction = type;
    notifyListeners();
  }

  String get getImagePlainPath {
    return imagePlainPath;
  }

  String get getImagePlainSize {
    return humanSizeReadable(size: imagePlainSize, decimals: 0);
  }

  void setImagePlainPath(String pathFile) {
    imagePlainPath = pathFile;
    notifyListeners();
  }

  void setImagePlainSize(int imagePlainSizeFile) {
    imagePlainSize = imagePlainSizeFile;
    notifyListeners();
  }

  String get getImageKeyPath {
    return imageKeyPath;
  }

  String get getImageKeySize {
    return humanSizeReadable(size: imageKeySize, decimals: 0);
  }

  void setImageKeyPath(String pathFile) {
    imageKeyPath = pathFile;
    notifyListeners();
  }

  void setImageKeySize(int imageKeySizeFile) {
    imageKeySize = imageKeySizeFile; // len
    notifyListeners();
  }

  setTempPath(String t) {
    tempPath = t;
    notifyListeners();
  }

  String get getTempPath {
    return tempPath;
  }

  // checking

  bool get isImagePlainPicked {
    if (imagePlainSize > 30) {
      return true;
    } else {
      return false;
    }
  }

  bool get isImageKeyPicked {
    if (imageKeySize > 30) {
      return true;
    } else {
      return false;
    }
  }

  bool isImageKeyLargerThanPlain() {
    if (imageKeySize >= imagePlainSize) {
      return true;
    }
    return false;
  }

  String humanSizeReadable({int size = 0, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    var i = (log(size) / log(1024)).floor();
    return ((size / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  Future<void> clear() async {
    imagePlainPath = 'null';
    imagePlainSize = 0;
    imageKeyPath = 'null';
    imageKeySize = 0;
    tempPath = 'null';
    isLoading = false;
  }

  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  bool get loading {
    return isLoading;
  }

  // Future<void> run(context) async {
  //   await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewImage())); // path = null
  // }

  Future<String> runAfter(String getImagePlainPath_new, String getImageKeyPath_new) async {
    imgl.Image img = await EncryptDecrypt(getImagePlainPath_new, getImageKeyPath_new);
    Directory dir = await getApplicationDocumentsDirectory();
    File file = await File(dir.path + "/B9mah_Encrypt${Random().nextInt(1000)}.png").create();
    await file.writeAsBytes(imgl.encodePng(img));
    print(file.path);
    return file.path;
  }
}
