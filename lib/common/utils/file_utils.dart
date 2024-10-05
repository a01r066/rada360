import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rada360/common/utils/log.dart';

class FileUtils {
  static Future<XFile?> compressAndGetFile({
    required File file,
    required String fileName,
    required String dirName,
    int? minWidth,
    int? minHeight,
    int? quality,
  }) async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Directory newPathDir = Directory('${appDocDirectory.path}/$dirName');

    if (!newPathDir.existsSync()) {
      Log.d("$dirName is not exist. Create");
      newPathDir = await Directory('${appDocDirectory.path}/$dirName')
          .create(recursive: true);
    } else {
      Log.d("$dirName is exist");
    }

    XFile? xFile = await FlutterImageCompress.compressAndGetFile(
      file.path,
      "${newPathDir.path}/$fileName",
      minWidth: minWidth ?? 320,
      minHeight: minHeight ?? 480,
      quality: 100,
      rotate: 0,
      keepExif: false,
      autoCorrectionAngle: true,
    );

    return xFile;
  }

  static Future<File> assetsFile({String? path}) async {
    return File(path ?? "");
  }

  // Find the correct local path
  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Create a reference to the file location
  static Future<File> localFile() async {
    final path = await localPath;
    return File('$path/counter.txt');
  }

  // Write data to the file
  Future<File> writeCounter(int counter) async {
    final file = await localFile();

    // Write the file
    return file.writeAsString('$counter');
  }

  // Read data from the file
  static Future<String> readAsString(String filePath) async {
    try {
      // read file
      final contents = await rootBundle.loadString(filePath);
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return e.toString();
    }
  }

  static Future<int> readCounter() async {
    try {
      // load file
      final file = await localFile();

      // read file
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  static Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }
}
