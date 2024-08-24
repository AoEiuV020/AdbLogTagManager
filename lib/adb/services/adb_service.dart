import 'dart:async';

import 'package:adblogtagmanager/adb/models/device.dart';

abstract class AdbService {
  /// 获取连接的设备列表
  Future<List<Device>> getConnectedDevices();

  /// 清除设备日志
  Future<void> clearLogs(Device device);

  /// 连接设备
  Future<void> connect(String ipAddress);
}
