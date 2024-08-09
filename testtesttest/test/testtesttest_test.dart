import 'package:flutter_test/flutter_test.dart';
import 'package:testtesttest/testtesttest.dart';
import 'package:testtesttest/testtesttest_platform_interface.dart';
import 'package:testtesttest/testtesttest_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTesttesttestPlatform
    with MockPlatformInterfaceMixin
    implements TesttesttestPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TesttesttestPlatform initialPlatform = TesttesttestPlatform.instance;

  test('$MethodChannelTesttesttest is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTesttesttest>());
  });

  test('getPlatformVersion', () async {
    Testtesttest testtesttestPlugin = Testtesttest();
    MockTesttesttestPlatform fakePlatform = MockTesttesttestPlatform();
    TesttesttestPlatform.instance = fakePlatform;

    expect(await testtesttestPlugin.getPlatformVersion(), '42');
  });
}
