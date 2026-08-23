import 'package:flutter/material.dart';

import 'components/hero_card.dart';
import 'components/poster_card.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      // 1. Top App Bar[cite: 4]
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        title: Text(
          'MediaHub',
          style: TextStyle(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: const NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCwO_qHhSKXY3cM2hJwRm-h1Pa4AmAgwHuaz21LIY3r-vP-bhwQbgl-qwJnJKqPJ9J1-B0MPMl99e-yjnY0sZfnssZWwLNBIfF7KG3T0XQB5wo4hccw550MCMByw9MMMmTNa6TqD_IRz-gL1B-eWRIrnhy9iXzqWflA9DstzCrrGR1uG3RvBUrgISRUIwh7FmM_Vyb9Eh9yHXbXCu4qgx6XnTyNy7DxniF6QPW4RkGZJLBEMXLzJG0QaA',
              ),
              backgroundColor: colorScheme.surfaceContainerHighest,
            ),
          ),
        ],
      ),

      // 2. Conteúdo Principal[cite: 4]
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeroCard(
              title: 'The Obsidian King',
              subtitle: 'S02E04 • Próximo',
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAaEKp4DoPj-tr3w3C5D0UbwXCSowQMYuF2x8SLFuwbo2ZrvKrJ7j3IMsxKTOFFxOyFJXx9qdwpwiODdTp3Yu1ZgzdtJKaxfI7OtHItrWHhtXy6NoNjwgMmx-TmNStN1-F2KQPvOo2GNvb8mo-kJDw1n5jpbpJsSi4uDuPbiJM_1zRw6dAQ-OP2W3tk0F1rdsUK9RERzlFKsHEreMo-d0Csej9Oxmm_L2Y6qAV9NOdNmL1XEcd5ByG1Pg',
            ),
            const SizedBox(height: 32),
            Text(
              'Continue Consuming',
              style: Theme.of(context).textTheme.titleLarge
                  ?.copyWith(color: colorScheme.onSurface),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height:
                  230, // Altura para comportar a imagem (aspect 0.65) + textos
              child: ListView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                children: const [
                  PosterCard(
                    title: 'Neon Horizon',
                    progress: 0.45,
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuArE3A1gl4dMjKr33BKI0rf8i0POlgYH1ovakgd1CiTIHBxxWDjz1KVaVlPm75zyppvLPAnVNK6tZAeSrHPbggmmNBD2VFP5JX5FJ-bg0wjIHRR8RqT6wjsNGN1TVKq3OCssRj06gOhjDs6wlYGMWd1UV3v0yAZVF477TJx5qPUJeiJ_p_ku4Jl5pb44yPRaQs2h5fx5uoe1lLaL24PlPcwTTXGNYi8DcLWHcfiOqNwWZcKJ4CWOzwKpQ',
                  ),
                  SizedBox(width: 16),
                  PosterCard(
                    title: 'Time\'s Echo',
                    progress: 0.80,
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB_tXmZ8rHPxeGUzvxyVVY84hqiafQUzw1rG_yWeguAueCOoQRHBwJugNcBZRm8dyIxYPfmChvZed822MWLOIqg2QUjzC9BVTrLp_naEPXMUGTsnL21BuxGSt1fK1CbTVNZGArZF3QNotjVOQ8RkU-wwAROWgayO9ucjARlzhFHeCbD_Dhpf4Up_VcZw9fspjnYLdsx5vlgak4eNnvdQoXxPbG1pRSBnSwSTzVQUx4CVFBTMWkBGl_79g',
                  ),
                  SizedBox(width: 16),
                  PosterCard(
                    title: 'Neon Drift',
                    progress: 0.15,
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC0oMkpB0MUgU2dT_EYG3N8WxTcHcYqehZSelhjflJj8V2dpBQM3XOlcN6Aen5jGIr_h0ygyq7BVvn-Ny8SCBkxT4hMGA80IBPgE_B5G-_fSAzzUVqkUyYMOSVmzByYjQ_JIrox6ql_lAc96FLOLrOyXO7GBENx6TDn6HXQGdMUts8A_JqwLOc4HlzcT248x-uudk_8dj7sVol2_gv-Pg8K6mGItUHUIheprk9MalwAJdsW7YXLKbwEqw',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // 3. Bottom Nav Bar nativa (Material 3)[cite: 4]
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (int index) {},
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.video_library_outlined),
            selectedIcon: Icon(Icons.video_library),
            label: 'Library',
          ),
          NavigationDestination(
            icon: Icon(Icons.leaderboard_outlined),
            selectedIcon: Icon(Icons.leaderboard),
            label: 'Stats',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
