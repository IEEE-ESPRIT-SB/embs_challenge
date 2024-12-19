import 'package:flutter/material.dart';

class AgeSelector extends StatefulWidget {
  final int initialAge;
  final ValueChanged<int> onAgeChanged;

  const AgeSelector({
    Key? key,
    required this.initialAge,
    required this.onAgeChanged,
  }) : super(key: key);

  @override
  _AgeSelectorState createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> {
  late int _selectedAge;
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _selectedAge = widget.initialAge;
    _scrollController = FixedExtentScrollController(
      initialItem: _selectedAge - 1,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.3,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 500,
        child: Stack(
          children: [
            _buildAgeWheel(),
            _buildTopGradientLine(context),
            _buildBottomGradientLine(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAgeWheel() {
    return ListWheelScrollView.useDelegate(
      controller: _scrollController,
      itemExtent: 100,
      diameterRatio: 1.5,
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: (index) {
        setState(() {
          _selectedAge = index + 1;
          widget.onAgeChanged(_selectedAge);
        });
      },
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) {
          final difference = (_selectedAge - (index + 1)).abs();
          double fontSize;
          double opacity;

          if (difference == 0) {
            fontSize = 100;
            opacity = 1.0;
          } else if (difference == 1) {
            fontSize = 65;
            opacity = 0.7;
          } else if (difference == 2) {
            fontSize = 40;
            opacity = 0.5;
          } else {
            return null;
          }

          return Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                color: Colors.white.withOpacity(opacity),
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
              child: Text('${index + 1}'),
            ),
          );
        },
        childCount: 100,
      ),
    );
  }

  Widget _buildTopGradientLine(BuildContext context) {
    return Positioned(
      top: 200,
      left: MediaQuery.of(context).size.width * 0.25,
      right: MediaQuery.of(context).size.width * 0.25,
      child: Container(
        height: 4,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF06C4E), Color(0xFF9834D6)],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomGradientLine(BuildContext context) {
    return Positioned(
      top: 315,
      left: MediaQuery.of(context).size.width * 0.25,
      right: MediaQuery.of(context).size.width * 0.25,
      child: Container(
        height: 4,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF06C4E), Color(0xFF9834D6)],
          ),
        ),
      ),
    );
  }
}
