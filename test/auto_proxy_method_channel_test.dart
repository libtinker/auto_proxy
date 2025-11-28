import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_proxy/auto_proxy_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAutoProxy platform = MethodChannelAutoProxy();
  const MethodChannel channel = MethodChannel('auto_proxy');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return {"host": "proxy.example.com", "port": 8080};
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getSystemProxy', () async {
    expect(await platform.getSystemProxy(), {"host": "proxy.example.com", "port": 8080});
  });
}
