import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:utibu_health_pharmacy_app/components/button.dart';

import 'package:utibu_health_pharmacy_app/components/custom_app_bar.dart';
import 'package:utibu_health_pharmacy_app/utils/config.dart';

class Inventorydetails extends StatefulWidget {
  const Inventorydetails({super.key});

  @override
  State<Inventorydetails> createState() => _InventorydetailsState();
}

class _InventorydetailsState extends State<Inventorydetails> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      //custom appbar widget
      appBar: const CustomAppBar(
        appTitle: 'Medicine Details',
        icon: FaIcon(Icons.arrow_back_ios),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const AboutMedInventory(),
            
            const DetailBody(),
            
            Padding(
              padding: const EdgeInsets.all(20),
              child: Button(
                width: double.infinity,
                title: 'Order Medicine',
                onPressed: () {
                  Navigator.of(context).pushNamed('order_page');
                },
                disable: false,
              ),
            ),
          ],
        ),
         ),   ),
    );
  }
}

class AboutMedInventory extends StatelessWidget {
  const AboutMedInventory({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/images/Piriton.jpeg'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          const Text(
            "Medication Name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Utibu Health Pharmacy',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Consult a doctor before ceasing or taking new medication',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          
          const InventoryInfo(),
          Config.spaceMedium,
          const Text(
            'About Medicine',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Config.spaceSmall,
          const Text(
            'Medicine Name  is an in the form of   Category Available at a subsidized amount of .',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class InventoryInfo extends StatelessWidget {
  const InventoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[InfoCard(price: "price", amount: "100")],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.price, required this.amount});
  final String price;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          children: <Widget>[
            Text(
              price,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              amount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
