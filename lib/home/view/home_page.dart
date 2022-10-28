import 'package:androidker_sneaker/home/cubit/home_cutbit.dart';
import 'package:androidker_sneaker/home/view/home_section.dart';
import 'package:androidker_sneaker/home/view/new_release_section.dart';
import 'package:androidker_sneaker/infras/infras.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) =>
          HomeCubit(HomeRepository(HomeRemoteService()))..initialize(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((HomeCubit cubit) => cubit.state.status);
    final tags = context.select((HomeCubit cubit) => cubit.state.tags);
    final selectedTag =
        context.select((HomeCubit cubit) => cubit.state.selectedTag);
    const colorCardBgColor = Color(0xfff6f5f8);
    Widget body;
    switch (status) {
      case HomeStateStatus.loading:
        body = const SizedBox.square(
          dimension: 32,
          child: CircularProgressIndicator(),
        );
        break;
      case HomeStateStatus.loaded:
        body = SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Text(
                      'Search Products',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: colorCardBgColor,
                    hintText: 'Try "Yezzy Boost 700"',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                    prefixIconConstraints:
                        BoxConstraints.tight(const Size(48, 24)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tags.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, pos) {
                    final tag = tags[pos];
                    final isSelected = tag.id == selectedTag;
                    return Card(
                      surfaceTintColor:
                          isSelected ? Colors.black : colorCardBgColor,
                      color: isSelected ? Colors.black : colorCardBgColor,
                      child: InkWell(
                        onTap: () =>
                            context.read<HomeCubit>().onTagPressed(tag.id),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            tag.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const HomeSection(
                categoryId: 'most-popular',
                sectionTitle: 'Most Popular',
              ),
              const SizedBox(height: 32),
              const NewReleaseSection(),
            ],
          ),
        );
        break;
      case HomeStateStatus.failed:
        body = Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              TextButton(onPressed: () {}, child: Text("Button")),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Try "Yezzy Boost 700"',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                    prefixIconConstraints:
                        BoxConstraints.tight(const Size(48, 24)),
                  ),
                ),
              ),
            ],
          ),
        );
        break;
      case HomeStateStatus.none:
        body = Container();
        break;
    }
    return Scaffold(
      body: SafeArea(child: body),
    );
  }
}
