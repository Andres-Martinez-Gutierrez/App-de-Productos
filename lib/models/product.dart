// To parse this JSON data, do
//
//     final products = productsFromMap(jsonString);

import 'dart:convert';

class Product {
  Product(
      {required this.disponible,
      this.imagen,
      required this.nombre,
      required this.precio,
      this.id});

  bool disponible;
  String? imagen;
  String nombre;
  int precio;
  String? id;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        disponible: json["disponible"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"],
      );

  Map<String, dynamic> toMap() => {
        "disponible": disponible,
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
      };

  Product copy() => Product(
        disponible: disponible,
        imagen: imagen,
        nombre: nombre,
        precio: precio,
        id: id,
      );
}
