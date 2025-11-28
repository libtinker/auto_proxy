import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'auto_proxy_method_channel.dart';

abstract class AutoProxyPlatform extends PlatformInterface {
  /// Constructs a AutoProxyPlatform.
  AutoProxyPlatform() : super(token: _token);

  static final Object _token = Object();

  static AutoProxyPlatform _instance = MethodChannelAutoProxy();

  /// The default instance of [AutoProxyPlatform] to use.
  ///
  /// Defaults to [MethodChannelAutoProxy].
  static AutoProxyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AutoProxyPlatform] when
  /// they register themselves.
  static set instance(AutoProxyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Map<String, dynamic>?> getSystemProxy() async {
    throw UnimplementedError('getSystemProxy() has not been implemented.');
  }
}
