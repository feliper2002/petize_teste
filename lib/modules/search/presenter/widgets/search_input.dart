import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final Size size;
  final TextEditingController controller;
  const SearchInput({super.key, required this.controller, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: size.width * .018),
      height: size.height * .047,
      width: size.width * .41,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Search",
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey[200]!)),
        ),
      ),
    );
  }
}
