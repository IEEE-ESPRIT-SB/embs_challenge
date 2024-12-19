import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.9,
      height: 57,
      decoration: ShapeDecoration(
        color: const Color(0x00222121),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF2E2B2F)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword && _obscureText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
              cursorColor: Colors.white,
              textAlignVertical:
                  TextAlignVertical.center, // Center text vertically
              decoration: InputDecoration(
                isCollapsed: true, // Ensures the content fits snugly
                contentPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: 0, // Removed vertical padding
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
          if (widget.isPassword)
            Padding(
              padding:
                  EdgeInsets.only(right: width * 0.03), // Responsive padding
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white54,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
