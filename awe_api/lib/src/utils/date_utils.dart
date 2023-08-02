DateTime dateTimeFromTimestamp(String? timestamp) =>
    timestamp != null && timestamp.isNotEmpty
        ? DateTime.parse(timestamp)
        : DateTime.now();

int? toEpoch(DateTime? time) => time?.millisecondsSinceEpoch;