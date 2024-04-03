import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:utibu_health_pharmacy_app/components/button.dart';
import 'package:utibu_health_pharmacy_app/components/custom_app_bar.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: 'Checkout Order',
        icon: FaIcon(Icons.arrow_back_ios),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
            child: Button(
              width: double.infinity,
              title: 'Process  Order',
              onPressed: () {
                Navigator.of(context).pushNamed('success_order');
              },
              disable: false,
            ),
          ),
        ),
      ]),
    );
  }
}
