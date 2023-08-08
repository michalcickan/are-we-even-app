enum HeaderField {
  authorization("Authorization"),
  deviceId("X-Device-ID");

  final String value;

  const HeaderField(this.value);
}
