import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:puppeteer/puppeteer.dart' as puppeteer;

Future<Response> onRequest(RequestContext context) async {
  puppeteer.Browser? browser;
  try {
    browser = await puppeteer.puppeteer.launch(
      headless: false,
      noSandboxFlag: true,
      slowMo: const Duration(milliseconds: 20),
      defaultViewport:
          const puppeteer.DeviceViewport(width: 1920, height: 1080),
    );
    return Response();
  } catch (e) {
    return Response(
      statusCode: HttpStatus.internalServerError,
      body: e.toString(),
    );
  } finally {
    await browser?.close();
  }
}
