import 'dart:io';
import 'pagetemplate.dart';

main() async {
  var server = await HttpServer.bind('127.0.0.1', 8080);
  print("Serving at ${server.address}:${server.port}");
  await for (HttpRequest request in server) {
    request.response
      ..headers.contentType = new ContentType("text", "html", charset: "utf-8")
      ..write(buildPage())
      ..close();
  }
}
