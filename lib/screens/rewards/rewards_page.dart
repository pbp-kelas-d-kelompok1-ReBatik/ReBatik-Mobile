import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/theme/app_gradients.dart';
import '../../core/widgets/primary_action_button.dart';
import '../../core/widgets/rebatik_app_bar.dart';
import '../../widgets/left_drawer.dart';

/// Halaman Points & Rewards dengan placeholder sebelum integrasi API.
class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fitur Rewards akan tersedia setelah integrasi API.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: rebatikAppBar('Points & Rewards'),
      drawer: const LeftDrawer(),
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: AppGradients.hero),
        child: SizedBox.expand(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 36),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _PageHeading(),
                    const SizedBox(height: 28),
                    _PointsOverview(
                      onDonateTap: () => _showComingSoon(context),
                    ),
                    const SizedBox(height: 28),
                    const _SectionDivider(),
                    const SizedBox(height: 24),
                    const _VoucherSection(),
                    const SizedBox(height: 28),
                    const _SectionDivider(),
                    const SizedBox(height: 24),
                    const _HistorySection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PageHeading extends StatelessWidget {
  const _PageHeading();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'UPCYCLE · CULTURE · VALUE',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.brown,
            fontFamily: AppFonts.plusJakartaSans,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.2,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Points and Rewards',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.brownDark,
            fontFamily: AppFonts.garamond,
            fontSize: 38,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Donasikan kain dan selesaikan upcycling untuk menukar poin dengan voucher Marketplace.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge
              ?.copyWith(color: AppColors.brown, height: 1.5),
        ),
      ],
    );
  }
}

class _PointsOverview extends StatelessWidget {
  const _PointsOverview({required this.onDonateTap});

  final VoidCallback onDonateTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.upcyclingPanel,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Poin Saya',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.brownDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Poin bertambah setiap donasi kain Anda diverifikasi tim ReBatik.',
              style: TextStyle(color: AppColors.brownMuted, height: 1.5),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.upcyclingSurface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.upcyclingCardBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'POIN TERSEDIA',
                    style: TextStyle(
                      color: AppColors.brownMuted,
                      fontFamily: AppFonts.plusJakartaSans,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                        color: AppColors.brown,
                                        fontSize: 72,
                                        height: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8, bottom: 9),
                                  child: Text(
                                    'poin',
                                    style: TextStyle(
                                      color: AppColors.brownMuted,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const _TierPill(label: 'Penenun Pemula'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        AppAssets.happyMascot,
                        width: 96,
                        height: 112,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const _LevelProgress(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 620
                    ? 3
                    : constraints.maxWidth >= 380
                    ? 2
                    : 1;
                const spacing = 10.0;
                final itemWidth =
                    (constraints.maxWidth - spacing * (columns - 1)) / columns;
                final stats = const [
                  _StatCard(value: '0', label: 'Kain didonasikan'),
                  _StatCard(value: '0', label: 'Upcycling selesai'),
                  _StatCard(value: '0 kg', label: 'Kain terselamatkan'),
                ];
                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: [
                    for (final stat in stats)
                      SizedBox(width: itemWidth, child: stat),
                  ],
                );
              },
            ),
            const SizedBox(height: 14),
            const _HowToEarnCard(),
            const SizedBox(height: 20),
            Center(
              child: PrimaryActionButton(
                label: 'Donasikan Kain Baru',
                trailingIcon: Icons.arrow_forward,
                onPressed: onDonateTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TierPill extends StatelessWidget {
  const _TierPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.upcyclingSoft,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.upcyclingCardBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.brown,
            fontFamily: AppFonts.plusJakartaSans,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _LevelProgress extends StatelessWidget {
  const _LevelProgress();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.upcyclingPanel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.upcyclingCardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Menuju Penenun Mahir',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.brownDark,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '0 dari 2.000 poin',
            style: TextStyle(
              fontFamily: AppFonts.plusJakartaSans,
              fontSize: 13,
              color: AppColors.brownMuted,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: const LinearProgressIndicator(
              value: 0,
              minHeight: 6,
              backgroundColor: AppColors.border,
              color: AppColors.actionAccent,
            ),
          ),
          const SizedBox(height: 18),
          const _TierLabel(name: 'Penenun Pemula', range: '0–1.999'),
          const Divider(height: 20, color: AppColors.border),
          const _TierLabel(name: 'Penenun Mahir', range: '2.000–4.999'),
          const Divider(height: 20, color: AppColors.border),
          const _TierLabel(name: 'Penenun Ahli', range: '5.000+'),
        ],
      ),
    );
  }
}

class _TierLabel extends StatelessWidget {
  const _TierLabel({required this.name, required this.range});

  final String name;
  final String range;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12,
      runSpacing: 4,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: AppColors.brown,
            fontFamily: AppFonts.plusJakartaSans,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '$range poin',
          style: const TextStyle(
            fontFamily: AppFonts.plusJakartaSans,
            fontSize: 13,
            color: AppColors.brownMuted,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.upcyclingSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.upcyclingCardBorder),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.brown,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.brownMuted),
          ),
        ],
      ),
    );
  }
}

class _HowToEarnCard extends StatelessWidget {
  const _HowToEarnCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.upcyclingSurface,
      child: ExpansionTile(
        leading: const Icon(Icons.info_outline, color: AppColors.brown),
        title: const Text(
          'Cara Mendapatkan Poin',
          style: TextStyle(
            color: AppColors.brownDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        children: const [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Poin diberikan setelah donasi kain diverifikasi atau permintaan '
              'upcycling selesai. Rincian poin akan mengikuti aturan pada API.',
              style: TextStyle(color: AppColors.brownMuted, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _VoucherSection extends StatelessWidget {
  const _VoucherSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Katalog Voucher',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.brownDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        const _PlaceholderPanel(
          icon: Icons.confirmation_num_outlined,
          title: 'Voucher akan ditampilkan di sini',
          description:
              'Katalog voucher Marketplace belum terhubung dengan aplikasi.',
        ),
      ],
    );
  }
}

class _HistorySection extends StatelessWidget {
  const _HistorySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Riwayat Poin',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.brownDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Semua poin yang masuk dan keluar tercatat di sini.',
          style: TextStyle(color: AppColors.brownMuted),
        ),
        const SizedBox(height: 14),
        const _PlaceholderPanel(
          icon: Icons.history,
          title: 'Belum ada aktivitas poin',
          description: 'Poin dari donasi dan upcycling akan tercatat di sini setelah API tersedia.',
        ),
      ],
    );
  }
}

class _PlaceholderPanel extends StatelessWidget {
  const _PlaceholderPanel({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.upcyclingSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.upcyclingCardBorder),
      ),
      child: Column(
        children: [
          Icon(icon, size: 34, color: AppColors.brownMuted),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.brown,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.brownMuted, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) =>
      const Divider(color: AppColors.border, height: 1);
}
