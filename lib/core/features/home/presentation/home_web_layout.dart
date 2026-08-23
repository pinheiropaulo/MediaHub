import 'package:flutter/material.dart';
import 'package:media_hub/core/features/home/presentation/components/activity_tile.dart';
import 'package:media_hub/core/features/home/presentation/components/continue_card.dart';
import 'package:media_hub/core/features/home/presentation/components/side_nav_bar.dart';

class HomeWebLayout extends StatelessWidget {
  const HomeWebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      body: Row(
        children: [
          // Menu Lateral isolado
          const SideNavBar(),

          // Corpo Principal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Lado Esquerdo (60%)
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildSectionHeader(context, 'Continuar Consumindo'),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 240,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              ContinueCard(
                                title: 'The Obsidian King',
                                subtitle: 'S02E04 - "The Awakening"',
                                progress: 0.65,
                                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBR4aYdS4dA7Sd89gdER35xXuifnTmX8JqDmy7HxGsZaMBHtHIcrF5gGSE9wQO6DnuRyI2zboabh2LIB0pi_LAgorzvWgb2pLt0m4rtYnfNu_1rAvdePikZrkoTXK1J5LoxnUOh9ioodPlj9_EOSVKUP0Co_VeQ48pNHu3JzKOpIdRl6bUBOHzQ2bWufO5saGorwhzoPC_ZTu2ZBthtKg3yStQiN4aLzjQlX-1QZxOCZGb_0dESjTFbTQ',
                              ),
                              SizedBox(width: 16),
                              ContinueCard(
                                title: 'Cyber Eclipse 2077',
                                subtitle: '45 horas jogadas',
                                progress: 0.82,
                                tag: 'Game',
                                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDW-rRQfxqeQ_e9QAhv1m6kvcfTb3koIi1cowVfKvLcARHiPOf32xbpLmisi5LeayJM8gpecdd5gqpK_Z33pahgyRb8uZvPcy3l8Z2ulQBQFt5LOW06u60W-Bx2wS_JsdRzaR8h57uNFNfRn8rGlJJCl1keJe6T_bB58bVxbbou8NA7Zzf1QQN8TpMvkx-QqcUVyXlMoWaQ2kJgYxFp0OSolZaoWmIlxrJyrGi6mVE9ijGPPzEeNT19gA',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 24),

                  // Lado Direito (40%)
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Atividade Recente e Descobertas',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 24),
                        const ActivityTile(
                          title: 'Neon Requiem',
                          subtitle: 'Adicionado à Biblioteca',
                          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDKxZTZFbyYw-rQ4pW-UCOkLiEgTLQtafIFXJy2ARF27k4oA-ct2uLkZ_v_CKEpy5PLtu2wtMwUSdCgyNup8hLCWPP4zu5-AS7Rw60sBVQ-ErY77hFU0P8EFh1kWL7C7WCblO1xthb1e2iR8z_OOtUZ4xe_wi2NCuM-ExhenlCn2EWPrtadANtdlxmyTAasWZ0-nTWHmuE9fEY_c6gbOoHO-gW-Qj9jK19Qfd1oWkKstgkfiamWTv4-3Q',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          iconAlignment: IconAlignment.end,
          icon: const Icon(Icons.chevron_right, size: 18),
          label: const Text('Ver tudo'),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ],
    );
  }
}
