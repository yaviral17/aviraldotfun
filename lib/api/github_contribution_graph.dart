import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

Future<Uint8List?> getGraphSvg() async {
  File? file;
  var headers = {'origin': 'x-requested-with'};
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://cors-anywhere.herokuapp.com/https://ghchart.rshah.org/yaviral17'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var data = await response.stream.toBytes();
    return data;
  } else {
    return null;
  }
}
