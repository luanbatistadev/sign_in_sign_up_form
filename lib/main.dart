import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:sign_in_sign_up_form/app/app_module.dart';
import 'package:sign_in_sign_up_form/app/app_widget.dart';

void main() =>
    runApp(ModularApp(module: AppModule(), child: const AppWidget()));
