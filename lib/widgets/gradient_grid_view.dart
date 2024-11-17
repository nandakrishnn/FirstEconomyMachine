 import 'package:flutter/material.dart';

LinearGradient getGradient(int index) {
    return index % 2 == 1
        ? const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 165, 158, 158),
              Colors.black,
            ],
          )
        : const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Color.fromARGB(255, 165, 158, 158),
            ],
          );
  }

  LinearGradient getGradient2(int index) {
    return index % 2 == 1
        ? const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 30, 29, 29),
              Color.fromARGB(255, 13, 13, 13),
            ],
          )
        : const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 13, 13, 13),
              Color.fromARGB(255, 30, 29, 29),
            ],
          );
  }
