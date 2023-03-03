// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

import '../../../product/widget/custom_text_field.dart';
import '../viewModel/add_bp_view_model.dart';

class AddBPView extends StatefulWidget {
  const AddBPView({super.key});

  @override
  State<AddBPView> createState() => _AddBPViewState();
}

class _AddBPViewState extends AddBPViewModel {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _diastolicController = TextEditingController();
  final TextEditingController _pulseController = TextEditingController();
  final String _systolicText = 'SYSTOLIC';
  final String _diastolicText = 'DIASTOLIC';
  final String _pulseText = 'PULSE';
  final String _saveText = 'SAVE';
  final String _mmHg = 'mmHg';
  final String _sysText = 'SYS';
  final String _diaText = 'DIA';
  final String _minituText = 'minute';
  final String _title = 'ADD BLOOD PRESSURE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
                style: context.textTheme.titleLarge,
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    _titleFields(),
                    _inputFields(),
                  ],
                ),
              ),
              _saveButton(context),
              Expanded(
                flex: context.isKeyBoardOpen ? 0 : 1,
                child: const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center _saveButton(BuildContext context) {
    return Center(
      child: Container(
        margin: context.verticalPaddingLow,
        width: context.width / 2,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              createModelAndAddItem(
                systolic: _systolicController.value.text,
                diastolic: _diastolicController.value.text,
                pulse: _pulseController.value.text,
              );
            }
          },
          child: ListTile(
            leading: const Icon(Icons.save_outlined),
            title: Text(_saveText),
          ),
        ),
      ),
    );
  }

  Expanded _titleFields() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: ListTile(
                title: Text(_sysText),
                subtitle: Text(_mmHg),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: ListTile(
                title: Text(_diaText),
                subtitle: Text(_mmHg),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: ListTile(
                title: Text(_pulseText),
                subtitle: Text(_minituText),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _inputFields() {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: CustomTextField(
                controller: _systolicController,
                titleText: _systolicText,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: CustomTextField(
                controller: _diastolicController,
                titleText: _diastolicText,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: CustomTextField(
                controller: _pulseController,
                titleText: _pulseText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
