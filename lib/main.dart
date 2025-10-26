import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:my_favorite_places/screens/places_screen.dart';

// Clean, professional color scheme with rich indigo and teal accents
final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color(0xFF4338CA), // Rich indigo
  primary: const Color(0xFF4338CA), // Deep indigo - sophisticated and trustworthy
  secondary: const Color(0xFF0F766E), // Professional teal - no violet
  tertiary: const Color(0xFF0891B2), // Cyan accent for variety
  surface: const Color(0xFFFEFEFE), // Pure white surface
  surfaceContainerLowest: const Color(0xFFFFFFFF),
  surfaceContainerLow: const Color(0xFFF8FAFC),
  surfaceContainer: const Color(0xFFF1F5F9),
  surfaceContainerHigh: const Color(0xFFE2E8F0),
  surfaceContainerHighest: const Color(0xFFCBD5E1),
  outline: const Color(0xFFD1D5DB),
  onSurface: const Color(0xFF0F172A),
  onSurfaceVariant: const Color(0xFF64748B),
);

final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color(0xFF6366F1), // Bright indigo for dark mode
  primary: const Color(0xFF6366F1), // Vibrant indigo
  secondary: const Color(0xFF14B8A6), // Bright teal - no violet
  tertiary: const Color(0xFF06B6D4), // Bright cyan accent
  surface: const Color(0xFF0F172A), // Deep navy surface
  surfaceContainerLowest: const Color(0xFF020617),
  surfaceContainerLow: const Color(0xFF1E293B),
  surfaceContainer: const Color(0xFF334155),
  surfaceContainerHigh: const Color(0xFF475569),
  surfaceContainerHighest: const Color(0xFF64748B),
  outline: const Color(0xFF475569),
  onSurface: const Color(0xFFF8FAFC),
  onSurfaceVariant: const Color(0xFF94A3B8),
);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.interTextTheme().copyWith(
    displayLarge: GoogleFonts.inter(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 45,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 36,
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
  ),
  cardTheme: CardThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(
        color: colorScheme.outline.withValues(alpha: 0.2),
        width: 1,
      ),
    ),
    surfaceTintColor: colorScheme.surfaceContainerLow,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorScheme.surfaceContainerHighest,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: colorScheme.primary,
        width: 2,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
    displayLarge: GoogleFonts.inter(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      color: darkColorScheme.onSurface,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: darkColorScheme.onSurface,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: darkColorScheme.onSurface,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      color: darkColorScheme.onSurface,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: darkColorScheme.onSurface,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: darkColorScheme.onSurface,
    ),
  ),
  cardTheme: CardThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(
        color: darkColorScheme.outline.withValues(alpha: 0.2),
        width: 1,
      ),
    ),
    surfaceTintColor: darkColorScheme.surfaceContainerLow,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: darkColorScheme.surfaceContainerHighest,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: darkColorScheme.primary,
        width: 2,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Favorite Places',
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, // Follows system theme
      home: const PlacesScreen(),
    );
  }
}
