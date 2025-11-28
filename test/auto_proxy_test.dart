import 'package:flutter_test/flutter_test.dart';
import 'package:auto_proxy/auto_proxy.dart';
import 'package:auto_proxy/auto_proxy_platform_interface.dart';
import 'package:auto_proxy/auto_proxy_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAutoProxyPlatform
    with MockPlatformInterfaceMixin
    implements AutoProxyPlatform {

  @override
  Future<Map<String, dynamic>?> getSystemProxy() => Future.value({"host": "proxy.example.com", "port": 8080});
}

void main() {
  final AutoProxyPlatform initialPlatform = AutoProxyPlatform.instance;

  test('$MethodChannelAutoProxy is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAutoProxy>());
  });

  test('getSystemProxy', () async {
    AutoProxy autoProxyPlugin = AutoProxy();
    MockAutoProxyPlatform fakePlatform = MockAutoProxyPlatform();
    AutoProxyPlatform.instance = fakePlatform;

    final result = await autoProxyPlugin.getSystemProxy();
    expect(result, isNotNull);
    expect(result!['host'], 'proxy.example.com');
    expect(result['port'], 8080);
  });
}
