import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../utility/padding/page_padding.dart';

class LoadingElevetedButton extends StatefulWidget {
  final Future<void> Function() onPressed;
  final String title;
  final ButtonStyle? style;
  const LoadingElevetedButton({Key? key, required this.onPressed, required this.title, this.style}) : super(key: key);

  @override
  _LoadingElevetedButtonState createState() => _LoadingElevetedButtonState();
}

class _LoadingElevetedButtonState extends State<LoadingElevetedButton> {
  bool _isLoading = false;
  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _onPressed() async {
    if (_isLoading) return;
    changeLoading();
    await widget.onPressed();
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: widget.style ?? ElevatedButton.styleFrom(shape: const StadiumBorder(), padding: const PagePadding.all()),
      onPressed: _onPressed,
      child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : Text(
                  widget.title,
                  style: context.textTheme.headline6?.copyWith(color: context.colorScheme.onSecondary),
                )),
    );
  }
}
