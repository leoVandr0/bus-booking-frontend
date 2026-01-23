// ignore_for_file: avoid_print

class SimpleAuthService {
  // Simple in-memory storage (replace with API calls)
  static String? _userEmail;
  static String? _userName;
  
  static String? get userEmail => _userEmail;
  static String? get userName => _userName;
  
  // Mock register function
  static Future<bool> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required DateTime dob,
    required String userType,
    required String password,
  }) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Store user info
    _userEmail = email;
    _userName = '$firstName $lastName';
    
    // ignore: duplicate_ignore
    // ignore: avoid_print
    print('Registered: $email as $userType');
    return true; // Success
  }
  
  // Mock login function
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Simple validation
    if (email.isNotEmpty && password.isNotEmpty) {
      _userEmail = email;
      _userName = email.split('@').first;
      print('Logged in: $email');
      return true;
    }
    return false;
  }
  
  static void logout() {
    _userEmail = null;
    _userName = null;
    print('Logged out');
  }
  
  static bool get isLoggedIn => _userEmail != null;
}