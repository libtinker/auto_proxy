import Flutter
import UIKit
import CFNetwork

public class AutoProxyPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "auto_proxy", binaryMessenger: registrar.messenger())
    let instance = AutoProxyPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getProxy":
            // 获取系统代理配置
            if let proxySettings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [AnyHashable: Any] {
                
                let url = URL(string: "http://www.baidu.com")! as CFURL
                let proxies = CFNetworkCopyProxiesForURL(url, proxySettings as CFDictionary).takeRetainedValue() as? [[AnyHashable: Any]]
                
                if let firstProxy = proxies?.first {
                    let host = firstProxy[kCFProxyHostNameKey] as? String ?? ""
                    let port = firstProxy[kCFProxyPortNumberKey] as? Int ?? 0
                    result(["host": host, "port": port])
                    return
                }
            }
            // 如果没有获取到代理
            result(["host": "", "port": 0])

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
