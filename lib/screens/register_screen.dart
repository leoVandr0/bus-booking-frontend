import 'package:flutter/material.dart';
import '../services/simple_auth_services.dart' show SimpleAuthService;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Form controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();
  
  // Form key
  final _formKey = GlobalKey<FormState>();
  
  // State variables
  DateTime? _selectedDate;
  String _selectedType = 'Passenger';
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  String _countryCode = '+91'; // Default to India
  
  // Comprehensive country codes list
  final List<Map<String, String>> _countryCodes = [
    {"code": "+1", "country": "United States"},
    {"code": "+44", "country": "United Kingdom"},
    {"code": "+91", "country": "India"},
    {"code": "+86", "country": "China"},
    {"code": "+33", "country": "France"},
    {"code": "+49", "country": "Germany"},
    {"code": "+81", "country": "Japan"},
    {"code": "+82", "country": "South Korea"},
    {"code": "+61", "country": "Australia"},
    {"code": "+64", "country": "New Zealand"},
    {"code": "+55", "country": "Brazil"},
    {"code": "+52", "country": "Mexico"},
    {"code": "+7", "country": "Russia"},
    {"code": "+20", "country": "Egypt"},
    {"code": "+27", "country": "South Africa"},
    {"code": "+30", "country": "Greece"},
    {"code": "+31", "country": "Netherlands"},
    {"code": "+32", "country": "Belgium"},
    {"code": "+34", "country": "Spain"},
    {"code": "+39", "country": "Italy"},
    {"code": "+41", "country": "Switzerland"},
    {"code": "+46", "country": "Sweden"},
    {"code": "+47", "country": "Norway"},
    {"code": "+48", "country": "Poland"},
    {"code": "+60", "country": "Malaysia"},
    {"code": "+62", "country": "Indonesia"},
    {"code": "+63", "country": "Philippines"},
    {"code": "+65", "country": "Singapore"},
    {"code": "+66", "country": "Thailand"},
    {"code": "+84", "country": "Vietnam"},
    {"code": "+90", "country": "Turkey"},
    {"code": "+92", "country": "Pakistan"},
    {"code": "+93", "country": "Afghanistan"},
    {"code": "+94", "country": "Sri Lanka"},
    {"code": "+95", "country": "Myanmar"},
    {"code": "+98", "country": "Iran"},
    {"code": "+212", "country": "Morocco"},
    {"code": "+213", "country": "Algeria"},
    {"code": "+216", "country": "Tunisia"},
    {"code": "+218", "country": "Libya"},
    {"code": "+220", "country": "Gambia"},
    {"code": "+221", "country": "Senegal"},
    {"code": "+222", "country": "Mauritania"},
    {"code": "+223", "country": "Mali"},
    {"code": "+224", "country": "Guinea"},
    {"code": "+225", "country": "Ivory Coast"},
    {"code": "+226", "country": "Burkina Faso"},
    {"code": "+227", "country": "Niger"},
    {"code": "+228", "country": "Togo"},
    {"code": "+229", "country": "Benin"},
    {"code": "+230", "country": "Mauritius"},
    {"code": "+231", "country": "Liberia"},
    {"code": "+232", "country": "Sierra Leone"},
    {"code": "+233", "country": "Ghana"},
    {"code": "+234", "country": "Nigeria"},
    {"code": "+235", "country": "Chad"},
    {"code": "+236", "country": "Central African Republic"},
    {"code": "+237", "country": "Cameroon"},
    {"code": "+238", "country": "Cape Verde"},
    {"code": "+239", "country": "Sao Tome and Principe"},
    {"code": "+240", "country": "Equatorial Guinea"},
    {"code": "+241", "country": "Gabon"},
    {"code": "+242", "country": "Republic of the Congo"},
    {"code": "+243", "country": "Democratic Republic of the Congo"},
    {"code": "+244", "country": "Angola"},
    {"code": "+245", "country": "Guinea-Bissau"},
    {"code": "+246", "country": "British Indian Ocean Territory"},
    {"code": "+248", "country": "Seychelles"},
    {"code": "+249", "country": "Sudan"},
    {"code": "+250", "country": "Rwanda"},
    {"code": "+251", "country": "Ethiopia"},
    {"code": "+252", "country": "Somalia"},
    {"code": "+253", "country": "Djibouti"},
    {"code": "+254", "country": "Kenya"},
    {"code": "+255", "country": "Tanzania"},
    {"code": "+256", "country": "Uganda"},
    {"code": "+257", "country": "Burundi"},
    {"code": "+258", "country": "Mozambique"},
    {"code": "+260", "country": "Zambia"},
    {"code": "+261", "country": "Madagascar"},
    {"code": "+262", "country": "Reunion"},
    {"code": "+263", "country": "Zimbabwe"},
    {"code": "+264", "country": "Namibia"},
    {"code": "+265", "country": "Malawi"},
    {"code": "+266", "country": "Lesotho"},
    {"code": "+267", "country": "Botswana"},
    {"code": "+268", "country": "Eswatini"},
    {"code": "+269", "country": "Comoros"},
    {"code": "+290", "country": "Saint Helena"},
    {"code": "+291", "country": "Eritrea"},
    {"code": "+297", "country": "Aruba"},
    {"code": "+298", "country": "Faroe Islands"},
    {"code": "+299", "country": "Greenland"},
    {"code": "+350", "country": "Gibraltar"},
    {"code": "+351", "country": "Portugal"},
    {"code": "+352", "country": "Luxembourg"},
    {"code": "+353", "country": "Ireland"},
    {"code": "+354", "country": "Iceland"},
    {"code": "+355", "country": "Albania"},
    {"code": "+356", "country": "Malta"},
    {"code": "+357", "country": "Cyprus"},
    {"code": "+358", "country": "Finland"},
    {"code": "+359", "country": "Bulgaria"},
    {"code": "+370", "country": "Lithuania"},
    {"code": "+371", "country": "Latvia"},
    {"code": "+372", "country": "Estonia"},
    {"code": "+373", "country": "Moldova"},
    {"code": "+374", "country": "Armenia"},
    {"code": "+375", "country": "Belarus"},
    {"code": "+376", "country": "Andorra"},
    {"code": "+377", "country": "Monaco"},
    {"code": "+378", "country": "San Marino"},
    {"code": "+379", "country": "Vatican City"},
    {"code": "+380", "country": "Ukraine"},
    {"code": "+381", "country": "Serbia"},
    {"code": "+382", "country": "Montenegro"},
    {"code": "+383", "country": "Kosovo"},
    {"code": "+385", "country": "Croatia"},
    {"code": "+386", "country": "Slovenia"},
    {"code": "+387", "country": "Bosnia and Herzegovina"},
    {"code": "+389", "country": "North Macedonia"},
    {"code": "+420", "country": "Czech Republic"},
    {"code": "+421", "country": "Slovakia"},
    {"code": "+423", "country": "Liechtenstein"},
    {"code": "+500", "country": "Falkland Islands"},
    {"code": "+501", "country": "Belize"},
    {"code": "+502", "country": "Guatemala"},
    {"code": "+503", "country": "El Salvador"},
    {"code": "+504", "country": "Honduras"},
    {"code": "+505", "country": "Nicaragua"},
    {"code": "+506", "country": "Costa Rica"},
    {"code": "+507", "country": "Panama"},
    {"code": "+508", "country": "Saint Pierre and Miquelon"},
    {"code": "+509", "country": "Haiti"},
    {"code": "+590", "country": "Guadeloupe"},
    {"code": "+591", "country": "Bolivia"},
    {"code": "+592", "country": "Guyana"},
    {"code": "+593", "country": "Ecuador"},
    {"code": "+594", "country": "French Guiana"},
    {"code": "+595", "country": "Paraguay"},
    {"code": "+596", "country": "Martinique"},
    {"code": "+597", "country": "Suriname"},
    {"code": "+598", "country": "Uruguay"},
    {"code": "+599", "country": "Caribbean Netherlands"},
    {"code": "+670", "country": "Timor-Leste"},
    {"code": "+672", "country": "Norfolk Island"},
    {"code": "+673", "country": "Brunei"},
    {"code": "+674", "country": "Nauru"},
    {"code": "+675", "country": "Papua New Guinea"},
    {"code": "+676", "country": "Tonga"},
    {"code": "+677", "country": "Solomon Islands"},
    {"code": "+678", "country": "Vanuatu"},
    {"code": "+679", "country": "Fiji"},
    {"code": "+680", "country": "Palau"},
    {"code": "+681", "country": "Wallis and Futuna"},
    {"code": "+682", "country": "Cook Islands"},
    {"code": "+683", "country": "Niue"},
    {"code": "+685", "country": "Samoa"},
    {"code": "+686", "country": "Kiribati"},
    {"code": "+687", "country": "New Caledonia"},
    {"code": "+688", "country": "Tuvalu"},
    {"code": "+689", "country": "French Polynesia"},
    {"code": "+690", "country": "Tokelau"},
    {"code": "+691", "country": "Micronesia"},
    {"code": "+692", "country": "Marshall Islands"},
    {"code": "+850", "country": "North Korea"},
    {"code": "+852", "country": "Hong Kong"},
    {"code": "+853", "country": "Macau"},
    {"code": "+855", "country": "Cambodia"},
    {"code": "+856", "country": "Laos"},
    {"code": "+880", "country": "Bangladesh"},
    {"code": "+886", "country": "Taiwan"},
    {"code": "+960", "country": "Maldives"},
    {"code": "+961", "country": "Lebanon"},
    {"code": "+962", "country": "Jordan"},
    {"code": "+963", "country": "Syria"},
    {"code": "+964", "country": "Iraq"},
    {"code": "+965", "country": "Kuwait"},
    {"code": "+966", "country": "Saudi Arabia"},
    {"code": "+967", "country": "Yemen"},
    {"code": "+968", "country": "Oman"},
    {"code": "+970", "country": "Palestine"},
    {"code": "+971", "country": "United Arab Emirates"},
    {"code": "+972", "country": "Israel"},
    {"code": "+973", "country": "Bahrain"},
    {"code": "+974", "country": "Qatar"},
    {"code": "+975", "country": "Bhutan"},
    {"code": "+976", "country": "Mongolia"},
    {"code": "+977", "country": "Nepal"},
    {"code": "+992", "country": "Tajikistan"},
    {"code": "+993", "country": "Turkmenistan"},
    {"code": "+994", "country": "Azerbaijan"},
    {"code": "+995", "country": "Georgia"},
    {"code": "+996", "country": "Kyrgyzstan"},
    {"code": "+998", "country": "Uzbekistan"},
  ];
  
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  // Date picker
  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
  
  // Register function
  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _isLoading = true);
    
    try {
      // Call our simple auth service
      bool success = await SimpleAuthService.register(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        phone: '$_countryCode${_phoneController.text.trim()}',
        dob: _selectedDate ?? DateTime.now(),
        userType: _selectedType,
        password: _passwordController.text,
      );
      
      if (success) {
        // Navigate to home screen
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                
                // First Name
                TextFormField(
                  controller: _firstNameController,
                  decoration: _inputDecoration('First Name', Icons.person),
                  validator: (value) => value!.isEmpty ? 'Enter first name' : null,
                ),
                
                const SizedBox(height: 15),
                
                // Last Name
                TextFormField(
                  controller: _lastNameController,
                  decoration: _inputDecoration('Last Name', Icons.person_outline),
                  validator: (value) => value!.isEmpty ? 'Enter last name' : null,
                ),
                
                const SizedBox(height: 15),
                
                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration('Email', Icons.email),
                  validator: (value) {
                    if (value!.isEmpty) return 'Enter email';
                    if (!value.contains('@')) return 'Enter valid email';
                    return null;
                  },
                ),
                
                const SizedBox(height: 15),
                
                // Phone Number with Country Code
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        // Country Code Dropdown - Improved
                        Container(
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.lightBlue),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _countryCode,
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
                              iconSize: 24,
                              elevation: 8,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              items: _countryCodes.map((country) {
                                return DropdownMenuItem<String>(
                                  value: country["code"],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        // Flag emoji or icon
                                        Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blue[50],
                                          ),
                                          child: Center(
                                            child: Text(
                                              _getFlagEmoji(country["country"]!),
                                              style: const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            country["code"]!,
                                            style: const TextStyle(fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() => _countryCode = value!);
                              },
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: 10),
                        
                        // Phone Number Field
                        Expanded(
                          child: TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Phone number',
                              prefixIcon: const Icon(Icons.phone, color: Colors.blue),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.grey[100],
                            ),
                            validator: (value) {
                              if (value!.isEmpty) return 'Enter phone number';
                              if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                return 'Enter valid 10-digit number';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                const SizedBox(height: 15),
                
                // Date of Birth
                TextFormField(
                  controller: _dobController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    prefixIcon: const Icon(Icons.calendar_today, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  onTap: () => _pickDate(context),
                  validator: (value) => value!.isEmpty ? 'Select date of birth' : null,
                ),
                
                const SizedBox(height: 15),
                
                // User Type
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.lightBlue),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedType,
                    isExpanded: true,
                    underline: const SizedBox(),
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
                    items: const [
                      DropdownMenuItem(
                        value: 'Passenger',
                        child: Row(
                          children: [
                            Icon(Icons.person, color: Colors.blue, size: 20),
                            SizedBox(width: 8),
                            Text('Passenger'),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Driver',
                        child: Row(
                          children: [
                            Icon(Icons.drive_eta, color: Colors.green, size: 20),
                            SizedBox(width: 8),
                            Text('Driver'),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() => _selectedType = value!);
                    },
                  ),
                ),
                
                const SizedBox(height: 15),
                
                // Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() => _isPasswordVisible = !_isPasswordVisible);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Enter password';
                    if (value.length < 6) return 'Minimum 6 characters required';
                    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(value)) {
                      return 'Password must contain letters and numbers';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 30),
                
                // Register Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'CREATE ACCOUNT',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // Helper for input decoration
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.blue),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      fillColor: Colors.grey[100],
    );
  }
  
  // Helper to get flag emoji (simplified version)
  String _getFlagEmoji(String countryName) {
    // This is a simplified version. In a real app, you'd use a proper flag library
    if (countryName.contains("United States")) return "🇺🇸";
    if (countryName.contains("United Kingdom")) return "🇬🇧";
    if (countryName.contains("India")) return "🇮🇳";
    if (countryName.contains("China")) return "🇨🇳";
    if (countryName.contains("Australia")) return "🇦🇺";
    if (countryName.contains("Canada")) return "🇨🇦";
    if (countryName.contains("Germany")) return "🇩🇪";
    if (countryName.contains("France")) return "🇫🇷";
    if (countryName.contains("Japan")) return "🇯🇵";
    if (countryName.contains("Brazil")) return "🇧🇷";
    if (countryName.contains("Russia")) return "🇷🇺";
    if (countryName.contains("Italy")) return "🇮🇹";
    if (countryName.contains("Spain")) return "🇪🇸";
    return "🌍"; // Default globe emoji
  }
}

DateFormat(String s) {
}