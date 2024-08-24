// device.dart
import 'package:equatable/equatable.dart';

class Device extends Equatable {
  // 设备状态 (e.g., device, offline)

  const Device({
    required this.id,
    required this.status,
  });

  // 工厂方法，用于从 adb devices 的输出解析设备信息
  factory Device.fromAdbLine(String adbLine) {
    final parts = adbLine.split('\t');
    if (parts.length != 2) {
      throw FormatException('Invalid adb devices line: $adbLine');
    }
    return Device(id: parts[0], status: parts[1]);
  }
  final String id; // 设备 ID
  final String status;

  @override
  List<Object> get props => [id, status];

  @override
  String toString() => 'Device(id: $id, status: $status)';
}
