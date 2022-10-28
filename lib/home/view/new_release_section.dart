import 'package:androidker_sneaker/home/cubit/home_section_cubit.dart';
import 'package:androidker_sneaker/infras/infras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';

class NewReleaseSection extends StatelessWidget {
  const NewReleaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeSectionCubit(
        HomeRepository(HomeRemoteService()),
        'new-releases',
      )..initialize(),
      child: const NewReleaseSectionView(
        sectionTitle: 'New Releases',
      ),
    );
  }
}

class NewReleaseSectionView extends StatelessWidget {
  const NewReleaseSectionView({super.key, required this.sectionTitle});
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    final status =
        context.select((HomeSectionCubit cubit) => cubit.state.status);
    final products =
        context.select((HomeSectionCubit cubit) => cubit.state.products);
    Widget body;
    const cardHeight = 100.0;
    final cardShape = RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)).copyWith(
        bottomRight: const Radius.circular(24),
      ),
    );
    const colorCardBgColor = Color(0xfff6f5f8);

    switch (status) {
      case HomeSectionStateStatus.loading:
        body = const SizedBox.square(
          dimension: 32,
          child: CircularProgressIndicator(),
        );
        break;
      case HomeSectionStateStatus.loaded:
        body = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 16,
                left: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      sectionTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  PopupMenuButton<SortType>(
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Sort by',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 2),
                        Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                    itemBuilder: (ctx) => SortType.values
                        .map(
                          (type) => PopupMenuItem(
                            value: type,
                            child: Text(type.value),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: cardHeight,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: products.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, pos) {
                  final product = products[pos];
                  return SizedBox(
                    width: cardHeight * 1.2,
                    height: cardHeight,
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: cardShape,
                      color: colorCardBgColor,
                      surfaceTintColor: colorCardBgColor,
                      child: Image.network(
                        product.thumbnail!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
        break;
      case HomeSectionStateStatus.failed:
      case HomeSectionStateStatus.none:
        body = const SizedBox();
        break;
    }
    return body;
  }
}
