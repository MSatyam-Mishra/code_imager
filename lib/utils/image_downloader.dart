import 'package:universal_html/html.dart' as html;
import 'dart:io' as f;

import 'package:path_provider/path_provider.dart';

class ImgDownloader {
  //for other platform
  static Future<void> downloadImage(List<int> bytes) async {
    try {
      final directory = await getDownloadsDirectory();
      final file = f.File('${directory!.path}/image.png');
      await file.writeAsBytes(bytes);
      print('Image downloaded successfully');
    } catch (e) {
      print('Error occurred while downloading image: $e');
    }
  }

//for   web
  static Future<void> downloadImageWeb(List<int> bytes) async {
    final blob = html.Blob([bytes], 'image/png');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement()
      ..href = url
      ..download = 'image.png';

    anchor.click();
    html.Url.revokeObjectUrl(url);
  }
}
