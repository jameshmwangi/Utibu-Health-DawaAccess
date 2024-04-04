import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utibu_health_pharmacy_app/components/inventory_card.dart';
import 'package:utibu_health_pharmacy_app/components/med_card.dart';
import 'package:utibu_health_pharmacy_app/models/auth_model.dart';
import 'package:utibu_health_pharmacy_app/providers/dio_provider.dart';
import 'package:utibu_health_pharmacy_app/utils/config.dart';
import 'dart:convert';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> user = {};
   List<Map<String, dynamic>> medicationCategories = [
    {
      "icon": FontAwesomeIcons.prescriptionBottle,
      "category": "Syrup",
    },
    {
      "icon": FontAwesomeIcons.pills,
      "category": "Capsules",
    },
    {
      "icon": FontAwesomeIcons.tablets,
      "category": "Pills",
    },
    {
      "icon": FontAwesomeIcons.flask,
      "category": "Cream",
    },
  ];
  List<Map<String, dynamic>> medicationEntries = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

Future<void> getData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String token = prefs.getString('token') ?? ''; // Use await here
  if (token.isNotEmpty) {
    try {
      final response = await DioProvider().getMedicationsOrder(token); // Use await here
      if (response != null) {
        setState(() {
          medicationEntries = json.decode(response);
          isLoading = false;
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data: $error');
      }
      
    }
  }
}


  @override
  Widget build(BuildContext context) {
    Config().init(context);
     user = Provider.of<AuthModel>(context, listen: false).getUser;
    return Scaffold(
      body: user.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            user['name'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/profile1.jpg'),
                            ),
                          )
                        ],
                      ),
                      // Widgets for displaying medication categories
                      SizedBox(
                        height: Config.heightSize * 0.05,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: medicationCategories.length,
                          itemBuilder: (context, index) => Card(
                            margin: const EdgeInsets.only(right: 20),
                            color: Config.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Row(
                                children: <Widget>[
                                  FaIcon(
                                    medicationCategories[index]['icon'],
                                    color: Colors.white,
                                  ),
                                   const SizedBox(width: 20),
                                  Text(
                                    medicationCategories[index]['category'],
                                    style: const TextStyle(fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const MedicationCard(),
                      Config.spaceSmall,
                      const Text(' Medications ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),
                      
                      ...medicationEntries.map((entry) => InventoryCard(
                            name: entry['name'],
                            category: entry['category'],
                            route: 'inventory/${entry['id']}', 
                            imagePath: 'assets/images/capsules.webp', 
                          )),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
