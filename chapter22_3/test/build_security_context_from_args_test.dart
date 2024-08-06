import 'dart:io';

import 'package:chapter22_3/src/arguments_parser.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as path;

void main() {
  final chainPath = path.join('test', 'test-server.pem');
  final keyPath = path.join('test', 'test-server.key');

  group('Testing buildSecurityContextFromArgs()', () {
    test('Valid arguments', () async {
      expect(buildSecurityContextFromArgs(
          ['--chain-path=$chainPath', '--key-path=$keyPath']
      ), isA<SecurityContext>());
    },);

    test('Missing arguments', () async {
      expect(() => buildSecurityContextFromArgs([]), throwsArgumentError);
    },);

    test('Missing chain-path', () async {
      expect(() => buildSecurityContextFromArgs(['--key-path=$keyPath']), throwsArgumentError);
    },);

    test('Missing key-path', () async {
      expect(() => buildSecurityContextFromArgs(['--chain-path=$chainPath']), throwsArgumentError);
    },);
  },);
}
