DateTime dateTimeFromTimestamp(int? timestamp) {
  return timestamp != null
      ? DateTime.fromMillisecondsSinceEpoch(timestamp)
      : DateTime.now();
}

int? toEpoch(DateTime? time) => time?.millisecondsSinceEpoch;
