import 'package:androidker_sneaker/home/cubit/home_section_cubit.dart';
import 'package:androidker_sneaker/infras/infras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:model/model.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.categoryId,
    required this.sectionTitle,
  });
  final String categoryId;
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => HomeSectionCubit(
        HomeRepository(HomeRemoteService()),
        categoryId,
      )..initialize(),
      child: HomeSectionView(
        sectionTitle: sectionTitle,
      ),
    );
  }
}

class HomeSectionView extends StatelessWidget {
  const HomeSectionView({super.key, required this.sectionTitle});
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    final status =
        context.select((HomeSectionCubit cubit) => cubit.state.status);
    final products =
        context.select((HomeSectionCubit cubit) => cubit.state.products);
    Widget body;
    const cardHeight = 350.0;
    final cardShape = RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)).copyWith(
        bottomRight: const Radius.circular(24),
      ),
    );
    const cardBtnShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        bottomRight: Radius.circular(24),
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
                    width: cardHeight * 0.6,
                    height: cardHeight,
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: cardShape,
                      color: colorCardBgColor,
                      surfaceTintColor: colorCardBgColor,
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(16).copyWith(bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (product.thumbnail != null)
                                    Expanded(
                                      child: Image.network(
                                        product.thumbnail!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  NumberFormat.simpleCurrency(
                                    locale: 'en',
                                    decimalDigits: 0,
                                  ).format(product.price),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.push('/product/${product.id}');
                                },
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Colors.black,
                                  ),
                                  shape: MaterialStatePropertyAll(cardBtnShape),
                                  padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 24,
                                    ),
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ],
                          ),
                        ],
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
        body = Container();
        break;
    }

    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: body,
    );
  }
}
