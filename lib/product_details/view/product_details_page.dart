import 'package:androidker_sneaker/infras/infras.dart';
import 'package:androidker_sneaker/product_details/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => ProductDetailsCubit(
        ProductDetailsRepository(
          ProductDetailsRemoteService(),
        ),
      )..initialize(id),
      child: const ProductDetailsView(),
    );
  }
}

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    const colorCardBgColor = Color(0xfff6f5f8);
    Widget body;
    final status =
        context.select((ProductDetailsCubit cubit) => cubit.state.status);
    final product =
        context.select((ProductDetailsCubit cubit) => cubit.state.product);
    switch (status) {
      case CommonCubitStatus.initial:
      case CommonCubitStatus.loading:
        body = const SizedBox.square(
          dimension: 32,
          child: CircularProgressIndicator(),
        );
        break;
      case CommonCubitStatus.loaded:
        final favorited =
            context.select((ProductDetailsCubit value) => value.state.favorite);
        body = Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product?.name ?? '',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.1,
                      ),
                    ),
                    if (product?.image != null)
                      Image.network(
                        product!.image!,
                        height: 400,
                      ),
                    Text(
                      product?.description ?? '',
                      style: const TextStyle(
                        fontSize: 19,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      NumberFormat.currency(
                        decimalDigits: 0,
                        symbol: r'$',
                      ).format(product!.price),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () =>
                            context.read<ProductDetailsCubit>().markFavorite(),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: colorCardBgColor),
                          ),
                          child: favorited
                              ? const Icon(FontAwesomeIcons.solidHeart)
                              : const Icon(FontAwesomeIcons.heart),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(16),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.black),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'BUY NOW',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
        break;
      case CommonCubitStatus.error:
        final errorMsg =
            context.select((ProductDetailsCubit value) => value.state.errorMsg);
        body = Text(errorMsg ?? 'Error');
        break;
    }
    return Center(
      child: body,
    );
  }
}
