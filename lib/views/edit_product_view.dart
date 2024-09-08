import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
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
  int? price;
  late TextEditingController textController;
  late TextEditingController descController;
  late TextEditingController priceController;
  late TextEditingController imageController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    late ProductModel product =
        ModalRoute.of(context)?.settings.arguments as ProductModel;
    textController = TextEditingController(text: product.title);
    descController = TextEditingController(text: product.description);
    priceController = TextEditingController(text: product.price.toString());
    imageController = TextEditingController(text: product.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: textController,
              hintText: 'Name Product',
              onChanged: (value) {
                name = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: descController,
              hintText: 'Description',
              onChanged: (value) {
                desc = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: priceController,
              hintText: 'Price',
              onChanged: (value) {
                price = int.parse(value);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: imageController,
              hintText: 'Image',
              onChanged: (value) {
                image = value;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            const CustomButton(name: 'Update'),
          ],
        ),
      ),
    );
  }
}
