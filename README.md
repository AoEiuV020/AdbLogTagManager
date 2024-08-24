# Adblogtagmanager

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

1， flutter adb功能，  
https://github.com/nightmare-space/adb_kit  
使用adb可执行文件， 远程连接安卓设备，执行命令  
对于安卓设备本身还支持连接本机，  

2， adb log level,  
https://developer.android.com/reference/android/util/Log#isLoggable(java.lang.String,%20int)  
使用setprop设置一个tag的日志级别，  
对于超长的奇怪的tag似乎有问题，  
```shell
adb shell setprop log.tag.Looper S
```
3， 指定目标设备，  
https://stackoverflow.com/a/22090096/5615186  
adb连接多设备时，设置环境变量ANDROID_SERIAL就能让后续代码对指定设备生效，  
但只能是一个设备，多个设备就只能执行多次adb命令了，  
```shell
set ANDROID_SERIAL=192.168.0.61
```
4， 全tag默认日志级别设置，  
https://stackoverflow.com/a/75024096/5615186  
```shell
adb shell setprop persist.log.tag V
```
5, web端，
考虑直接tcp连接adb server，  
似乎没有dart上的实现，参考java的，  
https://github.com/vidstige/jadb  
好像太复杂了些，  
不知道有没有web专用的js实现的库能集成进来，或者直接web端绕过adb server连接手机的实现  
https://github.com/yume-chan/ya-webadb  
https://app.webadb.com/tcpip  
6, linux端，
想套用very good模板， 使用very good cli创建的项目， 不知道为啥very good不支持linux,后续想办法启用linux，  


[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
