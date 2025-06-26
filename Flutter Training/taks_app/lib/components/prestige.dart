
import 'package:flutter/material.dart';

Color prestigeConfig(int prestige) {
 switch (prestige) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.purple;
   case 3:
        return Colors.orangeAccent;
   case 4:
        return Colors.red;
      default:
        return Colors.black;
    }

}