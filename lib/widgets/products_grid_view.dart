import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/views/edit_product_view.dart';
import 'package:store_app/widgets/custom_product_card.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 90,
        childAspectRatio: 1.2,
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return CustomProductCard(
          product: widget.products[index],
          onTap: () async {
            final updatedProduct = await Navigator.pushNamed(
              context,
              EditProductView.id,
              arguments: widget.products[index],
            );
            if (updatedProduct is ProductModel) {
              setState(
                () {
                  widget.products[index] = updatedProduct;
                },
              );
            }
          },
        );
      },
    );
  }
}
