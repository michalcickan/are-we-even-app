import 'package:areweeven/managers/storage_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_manager_provider.g.dart';

@Riverpod(keepAlive: true)
IStorageManager storageManager(StorageManagerRef ref) {
  return StorageManager();
}
