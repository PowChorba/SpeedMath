import 'package:flutter/material.dart';
import 'package:target_speed_737/src/presentation/pages/home/component/hamburguer_content.dart';

void hamburguerDialog(
  BuildContext context,
) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return const HamburguerContent(); // El contenido del diálogo
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                .animate(anim1), // Animación de derecha a izquierda
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
