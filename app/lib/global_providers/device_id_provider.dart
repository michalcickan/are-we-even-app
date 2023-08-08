import 'package:client_information/client_information.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_id_provider.g.dart';

@Riverpod(keepAlive: true)
Future<String> deviceId(DeviceIdRef ref) async {
  final information = await ClientInformation.fetch();
  return information.deviceId;
}
