import 'dart:async';
import 'dart:io';
import 'package:adblogtagmanager/adb/models/device.dart';
import 'package:adblogtagmanager/adb/services/adb_service.dart';

class CommandAdbService implements AdbService {
  CommandAdbService({this.adbPath = 'adb'});
  final String adbPath;

  @override
  Future<List<Device>> getConnectedDevices() async {
    try {
      final result = await Process.run(adbPath, ['devices']);
      if (result.exitCode != 0) {
        throw Exception('Failed to get connected devices');
      }

      final devices = <Device>[];
      final lines = (result.stdout as String).split('\n');
      for (final line in lines) {
        if (line.contains('\t')) {
          devices.add(Device.fromAdbLine(line));
        }
      }
      return devices;
    } catch (e) {
      throw Exception('Error while fetching devices: $e');
    }
  }

  @override
  Future<void> clearLogs(Device device) async {
    try {
      final result =
          await Process.run(adbPath, ['-s', device.id, 'logcat', '-c']);
      if (result.exitCode != 0) {
        throw Exception('Failed to clear logs');
      }
    } catch (e) {
      throw Exception('Error while clearing logs: $e');
    }
  }

  @override
  Future<void> connect(String ipAddress) async {
    try {
      final result = await Process.run(adbPath, ['connect', ipAddress]);

      if (result.exitCode != 0) {
        throw Exception('Failed to connect to $ipAddress');
      }

      // 检查输出是否包含 "connected to"
      if (result.stdout.toString().contains('connected to')) {
        print('Successfully connected to $ipAddress');
      } else if (result.stdout.toString().contains('already connected to')) {
        print('$ipAddress is already connected');
      } else {
        throw Exception('Unexpected response: ${result.stdout}');
      }
    } catch (e) {
      throw Exception('Error while connecting to device: $e');
    }
  }
}
