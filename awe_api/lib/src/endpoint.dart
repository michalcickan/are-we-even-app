class Endpoint {
  factory Endpoint.user() => const Endpoint("user");

  factory Endpoint.userAddress() => const Endpoint("user/address");

  factory Endpoint.login(LoginType? loginType) => loginType != null
      ? Endpoint("login/$loginType")
      : const Endpoint("login");

  factory Endpoint.token() => const Endpoint("token");

  factory Endpoint.register() => const Endpoint("register");

  factory Endpoint.groupExpense(int groupId) =>
      Endpoint("groups/$groupId/expense");

  factory Endpoint.groupInvitations() => const Endpoint("groups/invitations");

  factory Endpoint.groupsInvitationsResolution(
          int invitationId, InvitationResolution resolution) =>
      Endpoint("groups/invitations/$invitationId/$resolution");

  factory Endpoint.expense(int expenseId) =>
      Endpoint("groups/expenses/$expenseId");

  factory Endpoint.groupExpenses(int groupId) =>
      Endpoint("groups/$groupId/expenses");

  factory Endpoint.group() => const Endpoint("group");

  factory Endpoint.groups() => const Endpoint("groups");

  factory Endpoint.groupUser(int groupId, int userId) =>
      Endpoint("groups/$groupId/users/$userId");

  final String path;

  const Endpoint(this.path);
}

enum LoginType {
  google,
  apple,
  email,
}

enum InvitationResolution { accept, decline }
