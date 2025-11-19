import 'package:flutter/material.dart';
import 'package:naiki_sportswear/screens/menu.dart';
import 'package:naiki_sportswear/screens/productlist_form.dart';
import 'package:naiki_sportswear/screens/product_entry_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Column(
                children: [
                  Text(
                    'Naiki Sportswear',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Perlengkapan olahraga terlengkap ada di sini!",
                      // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                      ),
                ],
              ),
            ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Product'),
            // Bagian redirection ke ProductFormPage
            onTap: () {
              /*
              TODO: Buatlah routing ke ProductFormPage di sini,
              setelah halaman ProductFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductFormPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Product List'),
            onTap: () {
                // Route to product list page
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
                );
            },
        ),
        ],
      ),
    );
  }
}