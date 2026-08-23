import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double iconSize;
  final double fontSize;
  final bool showSubtitle;

  const AppLogo({
    super.key,
    this.iconSize = 64,
    this.fontSize = 32,
    this.showSubtitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.sports_esports,
          size: iconSize,
          color: colorScheme.primaryContainer,
        ),
        const SizedBox(height: 12),
        Text(
          'MediaHub', // Nome atualizado conforme a especificação
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
            height: 1.1,
          ),
        ),
        if (showSubtitle) ...[
          const SizedBox(height: 8),
          Text(
            'Acesse sua biblioteca unificada',
            style: TextStyle(fontSize: 14, color: colorScheme.onSurfaceVariant),
          ),
        ],
      ],
    );
  }
}
