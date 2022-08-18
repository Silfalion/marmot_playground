import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:marmot_playground/localization/words.dart';

class InformationForm extends StatelessWidget {
  const InformationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'Alias',
            decoration: const InputDecoration(hintText: aliasLabel),
          ),
          
        ],
      ),
    );
  }
}
