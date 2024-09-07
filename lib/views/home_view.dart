import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/widgets/custom_product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartArrowDown),
          ),
        ],
        title: const Text(
          'New Trend',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 12,
          left: 12,
          top: 110,
        ),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 90,
            childAspectRatio: 1.2,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const CustomProductCard();
          },
        ),
      ),
    );
  }
}
