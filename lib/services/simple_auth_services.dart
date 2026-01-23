class SimpleAuthService {
  static String? userName;
  static String? userEmail;
  
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // For demo purposes, accept any non-empty credentials
    if (email.isNotEmpty && password.isNotEmpty) {
      userName = email.split('@').first;
      userEmail = email;
      return true;
    }
    return false;
  }
  
  static Future<bool> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required DateTime dob,
    required String userType,
    required String password,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // For demo purposes, accept all registrations
    userName = '$firstName $lastName';
    userEmail = email;
    return true;
  }
  
  static void logout() {
    userName = null;
    userEmail = null;
  }
}