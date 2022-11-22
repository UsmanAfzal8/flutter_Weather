import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    TextEditingController? controller,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.hint = '',
    this.color,
    this.contentPadding,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.showSuffixIcon = true,
    this.readOnly = false,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    this.style,
    this.border,
    this.starticon,
    Key? key,
  })  : _controller = controller,
        super(key: key);
  final TextEditingController? _controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final bool showSuffixIcon;
  final String? Function(String? value)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final Color? color;
  final String? initialValue;
  final String? hint;
  final bool readOnly;
  final bool autoFocus;
  final TextAlign textAlign;
  final InputBorder? border;
  final TextStyle? style;
  final IconData? starticon;
  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  void _onListen() => setState(() {});
  @override
  void initState() {
    widget._controller!.addListener(_onListen);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller!.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding:
          widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: widget.color ?? Theme.of(context).secondaryHeaderColor,
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        initialValue: widget.initialValue,
        controller: widget._controller,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType == TextInputType.number
            ? const TextInputType.numberWithOptions(signed: true, decimal: true)
            : widget.maxLines! > 1
                ? TextInputType.multiline
                : widget.keyboardType ?? TextInputType.text,
        textInputAction: widget.maxLines! > 1
            ? TextInputAction.newline
            : widget.textInputAction ?? TextInputAction.next,
        autofocus: widget.autoFocus,
        textAlign: widget.textAlign,
        onChanged: widget.onChanged,
        minLines: widget.minLines,
        maxLines: (widget._controller!.text.isEmpty) ? 1 : widget.maxLines,
        maxLength: widget.maxLength,
        style: widget.style,
        validator: (String? value) => widget.validator!(value),
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          fillColor: widget.color ??
              Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.15),
          hintText: widget.hint,
          hintStyle: widget.hint!.length > 15
              ? const TextStyle(fontSize: 14)
              : const TextStyle(fontSize: 15),
          suffixIcon: (widget._controller!.text.isEmpty ||
                  !widget.showSuffixIcon ||
                  widget.showSuffixIcon == false)
              ? null
              : IconButton(
                  splashRadius: 16,
                  onPressed: () => setState(() {
                    widget._controller!.clear();
                  }),
                  icon: const Icon(CupertinoIcons.clear, size: 18),
                ),
          prefixIcon: widget.starticon == null
              ? null
              : SizedBox(
                  width: 40,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        widget.starticon,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
          //       prefixIcon: Padding(
          //   // padding: const EdgeInsets.only(top: 15), // add padding to adjust icon
          //   child: Icon(widget.starticon),
          // ),
          focusColor: Theme.of(context).primaryColor,
          border: widget.border ?? InputBorder.none,
        ),
      ),
    );
  }
}
