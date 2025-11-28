// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'auto_proxy_platform_interface.dart';

class AutoProxy {
  Future<Map<String, dynamic>?> getSystemProxy() async {
    return AutoProxyPlatform.instance.getSystemProxy();
  }
}
