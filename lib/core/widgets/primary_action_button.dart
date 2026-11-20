import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../theme/app_gradients.dart';

/// Tombol aksi utama yang mengikuti `.primary-action-button` pada situs web.
class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    required this.label,
    required this.onPressed,
    this.trailingIcon,
    this.expand = false,
    super.key,
  });

  /// Teks tindakan yang ditampilkan pada tombol.
  final String label;

  /// Callback ketika tombol ditekan. Nilai `null` menonaktifkan tombol.
  final VoidCallback? onPressed;

  /// Ikon opsional yang ditampilkan setelah teks.
  final IconData? trailingIcon;

  /// Membuat tombol memenuhi lebar parent ketika bernilai `true`.
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final button = AnimatedOpacity(
      duration: const Duration(milliseconds: 150),
      opacity: onPressed == null ? 0.55 : 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppGradients.primaryAction,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.actionAccent),
          boxShadow: const [
            BoxShadow(
              color: AppColors.primaryActionShadow,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(999),
            focusColor: AppColors.focus.withValues(alpha: 0.20),
            hoverColor: AppColors.creamLight.withValues(alpha: 0.08),
            splashColor: AppColors.creamLight.withValues(alpha: 0.16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
              child: Row(
                mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.creamLight,
                        fontFamily: AppFonts.plusJakartaSans,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (trailingIcon != null) ...[
                    const SizedBox(width: 8),
                    Icon(trailingIcon, size: 18, color: AppColors.creamLight),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );

    return Semantics(
      button: true,
      enabled: onPressed != null,
      child: expand ? SizedBox(width: double.infinity, child: button) : button,
    );
  }
}
