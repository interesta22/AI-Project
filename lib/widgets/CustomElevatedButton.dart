import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;  // Add isSelected to determine if the button is selected

  const CustomElevatedButton({
    required this.label,
    required this.onPressed,
    required this.isSelected,  // Initialize isSelected in the constructor
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 5,
        backgroundColor: isSelected ? Colors.blueAccent : Colors.grey, // Change color based on isSelected
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : Colors.black, // Change text color if selected
        ),
      ),
    );
  }
}
