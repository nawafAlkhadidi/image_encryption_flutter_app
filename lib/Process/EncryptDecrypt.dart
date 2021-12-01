// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:io';
import 'package:image/image.dart' as imgl;

Future<imgl.Image> EncryptDecrypt(
  
    String imagePlainPath, String imageKeyPath) async {
  /// image decode
  imgl.Image imagePlain = imgl.decodeImage(File(imagePlainPath).readAsBytesSync());
  imgl.Image imageKey = imgl.decodeImage(File(imageKeyPath).readAsBytesSync());


  /// STEP one -  XOR algorithm ecrypt bassed on the key image -  more faster and secure
  ///  map - DNA
  for (var i = 0; i < imageKey.length; i++) {
    // shuffle > non-random
    int shift = (i + 1) % imageKey.length;
    int xshift = (i * 255) % imageKey.length;
    imageKey[shift] = imageKey[shift] ^ imageKey[xshift];
  }
  /// encrypt
  for (int i = 0; i < imagePlain.length; i++) {
    imagePlain[i] = imagePlain[i] ^ imageKey[i] * imageKey.length;
  }

  /// STEP two
  List<List<ColorRGBA>> colorGridPalin =
      getRGP(imagePlain); // store image RGB into colorGridPalin
  List<List<ColorRGBA>> colorGridKey =
      getRGP(imageKey); // store image key RGB into colorGridKey

  /// algorithm and minulapate RGB
  for (var x = 0; x < imagePlain.width; x++) {
    for (var y = 0; y < imagePlain.height; y++) {
      int r = colorGridPalin[x][y].red ^ colorGridKey[x][y].red;
      int g = colorGridPalin[x][y].green ^ colorGridKey[x][y].green;
      int b = colorGridPalin[x][y].blue ^ colorGridKey[x][y].blue;
      imagePlain.setPixelRgba(x, y, r, g, b);
    }
  }
  return imagePlain;
}

List<List<ColorRGBA>> getRGP(imgl.Image image) {
  final colorList = image.data.map<ColorRGBA>((e) => ColorRGBA(e)).toList();
  final List<List<ColorRGBA>> colorGrid = [];
  for (var x = 0; x < image.width; x++) {
    colorGrid.add([]);
    for (var y = 0; y < image.height; y++) {
      colorGrid[x].add(colorList[x + y * image.width]);
    }
  }
  return colorGrid;
}

class ColorRGBA {
  final int alpha, blue, green, red;
  ColorRGBA(int abgr)
      : alpha = abgr >> 24 & 0xFF,
        blue = abgr >> 16 & 0xFF,
        green = abgr >> 8 & 0xFF,
        red = abgr & 0xFF;
  @override
  String toString() {
    return 'R: $red, G: $green, B: $blue, A: $alpha';
  }
}
