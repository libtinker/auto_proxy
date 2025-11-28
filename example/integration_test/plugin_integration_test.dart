// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction


import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:auto_proxy/auto_proxy.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getSystemProxy test', (WidgetTester tester) async {
    final AutoProxy plugin = AutoProxy();
    final Map<String, dynamic>? proxyInfo = await plugin.getSystemProxy();
    // Just assert that some proxy info is returned.
    expect(proxyInfo, isNotNull);
  });
}
