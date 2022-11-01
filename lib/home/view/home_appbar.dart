import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, required this.state});
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    const colorCardBgColor = Color(0xfff6f5f8);
    final location = GoRouter.of(context).location;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
        top: MediaQuery.of(context).viewPadding.top,
      ),
      child: Row(
        children: [
          if (location == '/home')
            const Text(
              'Search Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (location.contains('/product'))
            InkWell(
              onTap: () => context.pop(),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: colorCardBgColor),
                ),
                child: const Icon(
                  FontAwesomeIcons.chevronLeft,
                  size: 16,
                ),
              ),
            ),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {},
            icon: Badge(
              child: const Icon(
                FontAwesomeIcons.bagShopping,
              ),
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(FontAwesomeIcons.ellipsisVertical),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'settings',
                child: Text(
                  'Settings',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
