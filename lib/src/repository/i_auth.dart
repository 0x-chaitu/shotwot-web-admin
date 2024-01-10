abstract class IAuth {
  Future<bool> signIn({required String email, required String password,});
  Future<void> logOut();
}