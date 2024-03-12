import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getGreetings() {
  // Get the greeting - morning, afternoon, evening based on current time
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Good morning!';
  } else if (hour < 18) {
    return 'Good afternoon!';
  } else {
    return 'Good evening!';
  }
}

String getRandomMessage() {
  // Hardcoded list of messages
  final messages = [
    "Curious about a book?",
    "Bookshelf feeling empty? Add a book",
    "Dig a book? Zap the barcode, to add it!",
    "Got a book on hand to summarize?"
  ];

  // Check if the list is empty
  if (messages.isEmpty) {
    return ""; // Return an empty string if the list is empty
  }

  // Generate a random index within the list bounds
  final random = math.Random();
  final index = random.nextInt(messages.length);

  // Return the message at the random index
  return messages[index];
}

bool showSearchResult(
  String searchFor,
  String searchInFirst,
  String searchInSecond,
) {
  // if searchFor is equal to * then return true else return output of contains
  if (searchFor == '*') {
    return true;
  } else {
    return ((searchInFirst.toLowerCase().contains(searchFor.toLowerCase())) ||
        (searchInSecond.toLowerCase().contains(searchFor.toLowerCase())));
  }
}
