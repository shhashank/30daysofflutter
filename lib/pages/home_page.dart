import 'package:alpha1/models/catalog.dart';
import 'package:alpha1/utils/routes.dart';
import 'package:alpha1/widgets/home_widgets/catalog_header.dart';
import 'package:alpha1/widgets/home_widgets/catalog_list.dart';
// import 'package:alpha1/widgets/drawer.dart';
// import 'package:alpha1/widgets/item_widget.dart';
import 'package:alpha1/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double days = 30.97;

  final String name = "CAt";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>(
          (item) => Item.fromMap(item),
        )
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ).iconSize(30),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}




// Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//             ? GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 16,
//                     crossAxisSpacing: 16),
//                 itemBuilder: (context, index) {
//                   final item = CatalogModel.items[index];
//                   return Card(
//                       clipBehavior: Clip.antiAlias,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       child: GridTile(
//                         header: Container(
//                           child: Text(
//                             item.name,
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             color: Colors.deepPurple,
//                           ),
//                         ),
//                         child: Image.network(item.image),
//                         footer: Container(
//                           child: Text(
//                             item.price.toString(),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(color: Colors.black),
//                         ),
//                       ));
//                 },
//                 itemCount: CatalogModel.items.length,
//               )
//             : Center(child: CircularProgressIndicator()),
//       ),
//       drawer: MyDrawer(),
