import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const BusBookingApp());
}

class BusBookingApp extends StatelessWidget {
  const BusBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Booking',
      debugShowCheckedModeBanner: false,
          theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          primary: const Color(0xFF6C63FF),
          secondary: const Color(0xFF4A45B1),
          background: Colors.white,
          surface: Colors.white,
          onPrimary: Colors.white,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6C63FF),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF6C63FF),
            side: const BorderSide(color: Color(0xFF6C63FF)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

// --- WELCOME SCREEN ---
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height - MediaQuery.of(context).padding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header with Image
                Flexible(
                  flex: 6,
                  child: Stack(
                    children: [
                      // Background with gradient overlay
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              const Color(0xFF6C63FF).withOpacity(0.1),
                            ],
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/bus_bg.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.directions_bus,
                            size: 100,
                            color: Color(0xFF6C63FF),
                          ),
                        ),
                      ),
                      
                      // Content overlay
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.9),
                                Colors.white.withOpacity(0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.directions_bus_rounded,
                                size: 80,
                                color: Color(0xFF6C63FF),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Book Your Bus",
                                style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2D3748),
                                  letterSpacing: 0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Find and book bus tickets to your favorite destinations with just a few taps.",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Buttons Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    children: [
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const BusSearchScreen(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.easeInOut;
                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);
                                  return SlideTransition(position: offsetAnimation, child: child);
                                },
                              ),
                            );
                          },
                          child: const Text("Login", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Create Account", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Skip Button
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const BusSearchScreen()),
                          );
                        },
                        child: Text(
                          "Skip for now",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- HOME SEARCH SCREEN ---
class BusSearchScreen extends StatelessWidget {
  const BusSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // App Bar with Gradient
          SliverAppBar(
            expandedHeight: size.height * 0.18,
            pinned: true,
            backgroundColor: theme.colorScheme.primary,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Bus Booking',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          
          // Main Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Toggle Buttons
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(child: _buildToggleButton(context, "One Way", true)),
                        const SizedBox(width: 8),
                        Expanded(child: _buildToggleButton(context, "Round Trip", false)),
                        const SizedBox(width: 8),
                        Expanded(child: _buildToggleButton(context, "Multi-City", false)),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Search Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // From Location
                        _buildLocationField(
                          context,
                          label: 'From',
                          value: 'Rajkot',
                          icon: Icons.flight_takeoff_rounded,
                          onTap: () {},
                        ),
                        
                        // Swap Button
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: IconButton(
                            onPressed: () {},
                            icon: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.swap_vert_rounded,
                                color: theme.colorScheme.primary,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        
                        // To Location
                        _buildLocationField(
                          context,
                          label: 'To',
                          value: 'Ahmedabad',
                          icon: Icons.location_on_rounded,
                          onTap: () {},
                        ),
                        
                        const Divider(height: 32, thickness: 1.2),
                        
                        // Date Selection
                        _buildDateField(
                          context,
                          label: 'Date',
                          date: 'Mon, 15 Jan',
                          subText: 'Tomorrow',
                          onTap: () {},
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Search Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Search Buses',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Popular Routes
                  Text(
                    'Popular Routes',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Popular Routes Grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3,
                    children: [
                      _buildPopularRoute(context, 'Rajkot', 'Ahmedabad'),
                      _buildPopularRoute(context, 'Mumbai', 'Pune'),
                      _buildPopularRoute(context, 'Delhi', 'Jaipur'),
                      _buildPopularRoute(context, 'Bangalore', 'Chennai'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Toggle Button Widget
  Widget _buildToggleButton(BuildContext context, String text, bool isActive) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: isActive ? Colors.white : Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.7),
              fontSize: 14,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  // Location Field Widget
  Widget _buildLocationField(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Date Field Widget
  Widget _buildDateField(
    BuildContext context, {
    required String label,
    required String date,
    String? subText,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.calendar_today_rounded,
                  color: Color(0xFF6C63FF),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          date,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                        if (subText != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              subText,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: const Color(0xFF4A5568),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Popular Route Widget
  Widget _buildPopularRoute(BuildContext context, String from, String to) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 0,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            children: [
              const Icon(Icons.directions_bus_rounded, size: 20, color: Color(0xFF6C63FF)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$from to $to',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4A5568),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Starting from ₹499',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
