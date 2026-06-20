import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary = Color(0xFF0046CC);
const secondary = Color(0xFF00F2FF);
const tertiary = Color(0xFF00A89F);
const neutral = Color(0xFF1A1C1E);
const colorPrimary = Color(0xFF003298);
const colorSecondary = Color(0xFF00696F);
const colorSecondaryContainer = Color(0xFF00F1FE);
const colorOnSecondaryContainer = Color(0xFF006A70);
const colorBackground = Color(0xFFF9F9FC);
const colorOnBackground = Color(0xFF1A1C1E);
const colorSurface = Color(0xFFF9F9FC);
const colorOnSurface = Color(0xFF1A1C1E);
const colorOnSurfaceVariant = Color(0xFF434654);
const colorSurfaceContainer = Color(0xFFEEEEF0);
const colorSurfaceContainerLow = Color(0xFFF3F3F6);
const colorSurfaceContainerHigh = Color(0xFFE8E8EA);
const colorSurfaceContainerHighest = Color(0xFFE2E2E5);
const colorOnPrimary = Colors.white;
const colorTertiaryContainer = Color(0xFF005E59);
const colorOnTertiaryContainer = Color(0xFF5BDBD1);
const colorError = Color(0xFFBA1A1A);

// --- TYPOGRAPHY HELPERS ---
TextStyle displayLgStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.hankenGrotesk(
    fontSize: fontSize ?? 56.0,
    fontWeight: fontWeight ?? FontWeight.w800,
    height: 1.1,
    letterSpacing: -1.0,
    color: color,
  );
}

TextStyle headlineLgStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.hankenGrotesk(
    fontSize: fontSize ?? 32.0,
    fontWeight: fontWeight ?? FontWeight.bold,
    height: 1.2,
    color: color,
  );
}

TextStyle headlineMdStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.hankenGrotesk(
    fontSize: fontSize ?? 24.0,
    fontWeight: fontWeight ?? FontWeight.w600,
    height: 1.3,
    color: color,
  );
}

TextStyle bodyLgStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize ?? 18.0,
    fontWeight: fontWeight ?? FontWeight.normal,
    height: 1.6,
    color: color,
  );
}

TextStyle bodyMdStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize ?? 16.0,
    fontWeight: fontWeight ?? FontWeight.normal,
    height: 1.6,
    color: color,
  );
}

TextStyle labelSmStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize ?? 12.0,
    fontWeight: fontWeight ?? FontWeight.w600,
    height: 1.0,
    letterSpacing: 0.6,
    color: color,
  );
}
