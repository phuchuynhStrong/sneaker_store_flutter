import 'package:androidker_sneaker/product_details/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectProductSizeDialog extends StatelessWidget {
  const SelectProductSizeDialog({super.key, required this.cubit});
  final ProductDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Builder(
        builder: (context) {
          final selected = context.select(
            (ProductDetailsCubit cubit) => cubit.state.selectedSize,
          );
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  margin: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  margin: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Size',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      CloseButton(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: kAvailableSizes.length,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24,
                    ),
                    itemBuilder: (context, pos) {
                      final size = kAvailableSizes[pos];
                      final isSelected = size == selected;
                      return TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            isSelected ? Colors.white : Colors.black,
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.read<ProductDetailsCubit>().selectSize(size);
                        },
                        child: Text(
                          size.toString(),
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(16),
                            ),
                            backgroundColor: const MaterialStatePropertyAll(
                              Colors.white,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'ADD TO CART',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
