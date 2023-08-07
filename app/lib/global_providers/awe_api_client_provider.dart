import 'package:areweeven/env/env.dart';
import 'package:areweeven/global_providers/auth_events_provider.dart';
import 'package:areweeven/global_providers/token_storage_provider.dart';
import 'package:awe_api/awe_api.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'awe_api_client_provider.g.dart';

@riverpod
AweAPIClient aweApiClient(AweApiClientRef ref) {
  return AweAPIClient(
    baseUrl: "${Env.apiHost}/",
    logger: kDebugMode
        ? PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            compact: false,
          )
        : null,
    tokensStorage: ref.read(
      tokenStorageProvider,
    ),
    authEvents: ref.read(
      authEventsProvider,
    ),
  );
}
