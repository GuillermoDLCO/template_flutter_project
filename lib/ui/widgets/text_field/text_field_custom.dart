import 'package:flutter/material.dart';
import 'package:walletonbankingapp/res/pallete_color.dart';

typedef TextCallback = Function(String text);
typedef ValidatorCallBack = Function(String text);

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({
    Key key,
    this.nameField,
    @required this.controller,
    this.validateText,
    this.focus,
    this.nextFocus,
    @required this.onChanged,
    this.onValidation,
    this.isFinal = false,
    this.isPassword = false,
    @required this.hintText,
  }) : super(key: key);
  final String nameField;
  final TextEditingController controller;
  final String validateText;
  final FocusNode focus;
  final FocusNode nextFocus;
  final bool isFinal;
  final bool isPassword;
  final TextCallback onChanged;
  final ValidatorCallBack onValidation;
  final String hintText;

  @override
  _TextFieldCustomState createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool _obscurePin = true;

  @override
  Widget build(BuildContext context) {
    IconData _iconObscurePin = _obscurePin ? Icons.visibility_off : Icons.visibility;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.nameField != null)
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(this.widget.nameField,
                style: TextStyle(
                  color: PalleteColor.titleTextColor,
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
        const SizedBox(height: 5.0),
        TextFormField(
          controller: widget.controller,
          autofocus: false,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: this.widget.isFinal ? TextInputAction.done : TextInputAction.next,
          focusNode: widget.focus,
          obscureText: widget.isPassword ? _obscurePin : false,
          keyboardType: TextInputType.text,
          onChanged: this.widget.onChanged,
          onFieldSubmitted: (v) {
            if (widget.nextFocus != null) FocusScope.of(context).requestFocus(widget.nextFocus);
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PalleteColor.textFieldBorderColor, width: 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PalleteColor.actionButtonColor, width: 1.2),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.2),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.2),
            ),
            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            errorText: widget.validateText,
            errorStyle: TextStyle(color: Colors.redAccent),
            hintText: widget.hintText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePin = !_obscurePin;
                      });
                    },
                    icon: Icon(_iconObscurePin, color: PalleteColor.informationActionColor))
                : null,
          ),
          validator: widget.onValidation,
        ),
      ],
    );
  }
}
