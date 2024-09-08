import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});
  static String id = 'EditProductView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              hintText: 'Name Product',
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              hintText: 'Description',
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              hintText: 'Price',
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              hintText: 'Image',
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(name: 'Update'),
          ],
        ),
      ),
    );
  }
}
