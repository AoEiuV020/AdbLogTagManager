import 'package:adblogtagmanager/adb/services/adb_service.dart';
import 'package:adblogtagmanager/adb/services/command_adb_service.dart';
import 'package:test/test.dart';

void main() {
  late AdbService adbService;

  setUp(() {
    adbService = CommandAdbService();
  });

  group('AdbService', () {
    test('connect should successfully connect to a real device', () async {
      const ipAddress = '192.168.2.35'; // 替换为你的设备IP地址

      try {
        await adbService.connect(ipAddress);
        print('Successfully connected to $ipAddress');
      } catch (e) {
        print('Failed to connect to $ipAddress: $e');
        fail('Connection failed');
      }
    });

    test('getConnectedDevices returns actual devices', () async {
      // 执行实际的 adb devices 命令
      final devices = await adbService.getConnectedDevices();

      // 断言至少有一个设备连接
      // expect(devices.isNotEmpty, true);
      print('Connected devices: $devices');
    });

    test('clearLogs clears logs on actual device', () async {
      final devices = await adbService.getConnectedDevices();
      if (devices.isNotEmpty) {
        // 清理日志
        await adbService.clearLogs(devices.first);
        print('Logs cleared on device');
      } else {
        print('No devices connected.');
      }
    });
  });
}
