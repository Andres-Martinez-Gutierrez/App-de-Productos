import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:productos_app/models/product.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final productsServices = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context);

    //
    if (productsServices.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        leading: IconButton(
          onPressed: () {
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');
          },
          icon: const Icon(Icons.logout_outlined),
        ),
      ),
      body: ListView.builder(
        itemCount: productsServices.products.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            productsServices.selectedProduct =
                productsServices.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(product: productsServices.products[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productsServices.selectedProduct =
              Product(disponible: false, nombre: '', precio: 0);
          Navigator.pushNamed(context, 'product');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
