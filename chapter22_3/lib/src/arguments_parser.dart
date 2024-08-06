import 'dart:io';

import 'package:args/args.dart';

SecurityContext buildSecurityContextFromArgs(List<String> arguments) {
  final argsParser = ArgParser()
    ..addOption('chain-path', mandatory: true)
    ..addOption('key-path', mandatory: true);

  final values = argsParser.parse(arguments);

  return SecurityContext()
    ..useCertificateChain(values['chain-path'] as String)
    ..usePrivateKey(values['key-path'] as String);
}
