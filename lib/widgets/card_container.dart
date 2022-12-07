import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  // Propiedades
  final Widget child;

  //Constructor
  const CardContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: _createShapeDecoration(),
        child: child,
      ),
    );
  }

  BoxDecoration _createShapeDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0.0, 5),
            )
          ]);
}
