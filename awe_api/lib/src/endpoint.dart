class Endpoint {
  factory Endpoint.user() => const Endpoint("user");

  factory Endpoint.settle(String code) => Endpoint("settle/$code");

  factory Endpoint.settleRequest(String? uuid) =>
      Endpoint(uuid != null ? "settle/request/$uuid" : "settle/request");

  final String path;

  const Endpoint(this.path);
}