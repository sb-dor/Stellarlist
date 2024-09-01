import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stellarlist/features/registration/domain/entities/registration_introduction_entity.dart';

class RegistrationIntroductionModel extends RegistrationIntroductionEntity {
  RegistrationIntroductionModel(
    super.title,
    super.color,
  );

  static final List<RegistrationIntroductionModel> data = [
    RegistrationIntroductionModel(
      "Create task at the speed of thought",
      Colors.purple,
    ),
    RegistrationIntroductionModel(
      "Take notes and transform thoughts into actions",
      HexColor('#f54f38'),
    ),
    RegistrationIntroductionModel(
      "Start your next project in second",
      Colors.amber,
    ),
    RegistrationIntroductionModel(
      "Organize your team with shared lists and tasks",
      Colors.blue,
    ),
    RegistrationIntroductionModel(
      "Get things done with a bit more fun",
      Colors.purple,
    ),
  ];
}
