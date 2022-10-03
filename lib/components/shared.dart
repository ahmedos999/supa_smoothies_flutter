import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textfield(String label, String hint, bool hidden, TextInputType type,
    IconData icon, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: hidden,
            keyboardType: type,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black45,
              ),
              hintText: hint,
              focusColor: Colors.grey,
              suffixIcon: Icon(icon, size: 25, color: const Color(0xff606470)),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white54,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff93DEFF)),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
