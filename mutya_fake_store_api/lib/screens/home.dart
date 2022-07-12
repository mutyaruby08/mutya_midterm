import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/api_service.dart';
import 'all_category.dart';
import 'cart_screen.dart';
import 'product_detail.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.view_list),
          //   onPressed: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (_) => AllCategoryScreen()),
          //   ),
          // ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartScreen(),
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('halu'),
        // child: FutureBuilder(
        //     future: _apiService.getAllProducts(),
        //     builder: (_, AsyncSnapshot<List<Product>> snapshot) {
        //       if (!snapshot.hasData) {
        //         return const CircularProgressIndicator();
        //       }
        //       final products = snapshot.data!;
        //       return ListView.separated(
        //         separatorBuilder: (_, __) => const Divider(thickness: 1),
        //         itemCount: products.length,
        //         itemBuilder: ((context, index) {
        //           final product = snapshot.data![index];
        //           return ListTile(
        //             title: Text(product.title![index]),
        //             leading: Image.network(
        //               product.image![index],
        //               height: 50,
        //               width: 50,
        //             ),
        //             subtitle: Text(product.price.toString()[index]),
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (_) => ProductDetailScreen(id: product.id!),
        //                 ),
        //               );
        //             },
        //           );
        //         }),
        //       );
        //     }),
      ),
    );
  }
}
