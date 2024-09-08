// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({super.key});
  static String id = 'EditProductView';

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  String? name, desc, image;
  String? price;
  late ProductModel product =
      ModalRoute.of(context)?.settings.arguments as ProductModel;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: 'Name Product',
                  onChanged: (value) {
                    name = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hintText: 'Description',
                  onChanged: (value) {
                    desc = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hintText: 'Price',
                  onChanged: (value) {
                    price = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hintText: 'Image',
                  onChanged: (value) {
                    image = value;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  name: 'Update',
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await updateProduct();
                      debugPrint('success update');
                      final udProduct = ProductModel(
                        id: product.id,
                        title: name ?? product.title,
                        price: price ?? product.price.toString(),
                        description: desc ?? product.description,
                        image: image ?? product.image,
                        category: product.category,
                      );
                      Navigator.pop(context, udProduct);
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct() async {
    await UpdateProduct().updateProduct(
      id: product.id,
      title: name ?? product.title,
      price: price ?? product.price.toString(),
      des: desc ?? product.description,
      image: image ?? product.image,
      category: product.category,
    );
  }
}
