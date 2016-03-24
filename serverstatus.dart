library serverstatus;

import 'dart:io';

class ServerStatus {
  String get time => new DateTime.now().toString();

  String get dartVersion => Platform.version;

  String get operatingSystem => Platform.operatingSystem;
  String get numberOfProcessors => Platform.numberOfProcessors.toString();

  String get localHostname => Platform.localHostname;
  String get pathSeparator => Platform.pathSeparator;
  String get executable => Platform.executable;
  String get resolvedExecutable => Platform.resolvedExecutable;

  String get isLinux => Platform.isLinux.toString();
  String get isIOS => Platform.isIOS.toString();
  String get isAndroid => Platform.isAndroid.toString();
  String get isWindows => Platform.isWindows.toString();
  String get isMacOS => Platform.isMacOS.toString();

  String get environmentVars {
    String out = '';
    Platform.environment.forEach((key, value) {
      out = out + "<tr><td>$key</td><td>$value</td></tr>";
    });
    return out;
  }
}
