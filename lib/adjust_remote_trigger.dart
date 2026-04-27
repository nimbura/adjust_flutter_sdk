//
//  adjust_remote_trigger.dart
//  Adjust SDK
//
//  Created by Ugljesa Erceg (@uerceg) on 30th March 2026.
//  Copyright (c) 2026-Present Adjust GmbH. All rights reserved.
//

class AdjustRemoteTrigger {
  final String label;
  final String payloadJson;

  AdjustRemoteTrigger({
    required this.label,
    required this.payloadJson,
  });

  factory AdjustRemoteTrigger.fromMap(dynamic map) {
    try {
      if (map == null || map is! Map) {
        throw Exception('Input map is null or has unexpected type.');
      }

      final String? label = map['label'];
      final dynamic payloadJson = map['payloadJson'];
      if (label == null) {
        throw Exception('Missing required remote trigger label.');
      }

      return AdjustRemoteTrigger(
        label: label,
        payloadJson: payloadJson is String && payloadJson.isNotEmpty
            ? payloadJson
            : '{}',
      );
    } catch (e) {
      throw Exception(
          '[AdjustFlutter]: Failed to create AdjustRemoteTrigger object from given map object. Details: ' +
              e.toString());
    }
  }
}
