import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? urlImage;
  const ProductImage({super.key, this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: Container(
        width: double.infinity,
        height: 450,
        decoration: _buildBoxDecoration(),
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45.0),
              topRight: Radius.circular(45.0),
            ),
            child: getImage(urlImage),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45.0),
          topRight: Radius.circular(45.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(00.5),
            blurRadius: 10.0,
            offset: const Offset(0, 5),
          )
        ],
      );

  Widget getImage(String? urlImage) {
    if (urlImage == null) {
      return const Image(
        image: AssetImage('assets/no-image.png'),
        fit: BoxFit.cover,
      );
    }

    if (urlImage.startsWith('http')) {
      return FadeInImage(
        image: NetworkImage(urlImage),
        placeholder: const AssetImage('assets/jar-loading.gif'),
        fit: BoxFit.cover,
      );
    } else {
      return Image.file(
        File(urlImage),
        fit: BoxFit.cover,
      );
    }
  }
}
