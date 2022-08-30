import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:marmot_playground/theme/adaptive_color_generator.dart';
import 'package:marmot_playground/theme/app_theme.dart';

class MarmotAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MarmotAppBar({
    super.key,
    this.leading = false,
  });

  final bool leading;

  @override
  State<MarmotAppBar> createState() => _MarmotAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _MarmotAppBarState extends State<MarmotAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.leading,
      actions: [
        IconButton(
          icon: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
              ? const Icon(Icons.light_mode)
              : const Icon(Icons.mode_night),
          onPressed: () {
            setState(() {
              if (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark) {
                AdaptiveTheme.of(context).setLight();
              } else {
                AdaptiveTheme.of(context).setDark();
              }
            });
          },
          color: adaptiveColorGenerator(context, lightColor, darkColor),
        )
      ],
    );
  }
}
