import 'package:flutter/material.dart';

import 'package:shopping_car/presentation/global_widgets/background.dart';
import 'package:shopping_car/presentation/screens/product/widgets/products_overview.dart';

class ProductsOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    size: 35,
                  ),
                  onPressed: () {},
                  tooltip: 'Shopping car',
                  splashRadius: 25,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ],
          leading: BackButton(),
        ),
        body: ProductsOverview(),
      ),
    );
  }
}
