import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getQuoteOfTheDay() async {
  var headers = {'origin': 'x-requested-with'};
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://cors-anywhere.herokuapp.com/https://zenquotes.io/api/today'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    Map<String, dynamic> quote =
        jsonDecode(await response.stream.bytesToString())[0];
    log("Quote of the day: $quote");
    quote['isSuccess'] = true;
    return quote;
  } else {
    Map<String, dynamic> quote =
        jsonDecode(await response.stream.bytesToString());
    log("Quote of the day: $quote");
    return {
      'isSuccess': false,
      'error': 'Failed to load quote of the day',
    };
  }
}

Future<Map<String, dynamic>> getRandomQuote() async {
  var headers = {'origin': 'x-requested-with'};
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://cors-anywhere.herokuapp.com/https://zenquotes.io/api/random'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    Map<String, dynamic> quote =
        jsonDecode(await response.stream.bytesToString())[0];
    log("Quote of the day: $quote");
    quote['isSuccess'] = true;
    return quote;
  } else {
    Map<String, dynamic> quote =
        jsonDecode(await response.stream.bytesToString());
    log("Quote of the day: $quote");
    return {
      'isSuccess': false,
      'error': 'Failed to load quote of the day',
    };
  }
}
