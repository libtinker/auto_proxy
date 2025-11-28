import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'auto_proxy_platform_interface.dart';

/// An implementation of [AutoProxyPlatform] that uses method channels.
class MethodChannelAutoProxy extends AutoProxyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('auto_proxy');

  @override
  Future<Map<String, dynamic>?> getSystemProxy() async {
    try {
      final result = await methodChannel.invokeMethod('getProxy');
      if (result == null) return null;
      return Map<String, dynamic>.from(result);
    } catch (e) {
      return null;
    }
  }
}
