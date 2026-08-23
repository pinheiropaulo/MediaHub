import 'package:flutter/material.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 80,
      color: colorScheme.surface,
      child: Column(
        children: [
          const SizedBox(height: 32),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colorScheme.surfaceContainerHighest),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuCTxL4bXrp1jyIjetdoVqwWD69dqP0f70qWNnEBVwDB7lP5-SnIzqb1rKRvUkeg-Pk8GhAxA8x7vKflKNokg4ygroq6LIROqC5b5gd6gwJaXKf_Fg26MCKcmoigi8fcHw9D6ckY5dsQfYLtRf3TXMiEn_fFly7kHYcSuCCXpWJE7v8YQb1ZfV_9b3XGPHkCevLs6rKOgh8cpaOoQvXHURYOGgcMRG6rYUXhFYlNJIGeizL2wLWPA7d32g',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 48),
          _NavIcon(
            icon: Icons.home,
            label: 'Home',
            isActive: true,
            colorScheme: colorScheme,
          ),
          _NavIcon(
            icon: Icons.library_books,
            label: 'Library',
            colorScheme: colorScheme,
          ),
          _NavIcon(
            icon: Icons.movie,
            label: 'Series',
            colorScheme: colorScheme,
          ),
          _NavIcon(icon: Icons.tv, label: 'Animes', colorScheme: colorScheme),
          _NavIcon(
            icon: Icons.sports_esports,
            label: 'Games',
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final ColorScheme colorScheme;

  const _NavIcon({
    required this.icon,
    required this.label,
    required this.colorScheme,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isActive
                  ? colorScheme.primaryContainer
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: isActive
                  ? colorScheme.onPrimaryContainer
                  : colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
