import 'package:flutter/material.dart';
import 'package:utibu_health_pharmacy_app/utils/config.dart';

class InventoryCard extends StatelessWidget {
  const InventoryCard({super.key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
          child: Card(
            elevation: 5,
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: Config.widthSize * 0.33,
                  child: Image.asset(
                    'assets/images/capsules.webp',
                    fit: BoxFit.fill,
                  ),
                ),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Inventory 1',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Type: Capsules",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                              size: 16,
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Text('4.5'),
                            Spacer(
                              flex: 1,
                            ),
                            Text('Reviews'),
                            Spacer(
                              flex: 1,
                            ),
                            Text('(20)'),
                            Spacer(
                              flex: 7,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(route);
          } // redirect to medication card

          ),
    );
  }
}