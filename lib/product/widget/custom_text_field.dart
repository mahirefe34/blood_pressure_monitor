import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController controller,
    required String titleText,
  })  : _controller = controller,
        _titleText = titleText,
        super(key: key);

  final TextEditingController _controller;
  final String _titleText;
  final String _customErrorText = 'Please enter correct data';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]+"))],
      maxLength: 3,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: _titleText,
          labelText: _titleText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      validator: (String? inputValue) {
        if (inputValue == null || inputValue.length < 2) {
          return _customErrorText;
        }
        return null;
      },
    );
  }
}
