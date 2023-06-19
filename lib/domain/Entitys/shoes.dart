import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hypeneedz/domain/Entitys/uuid.dart';

class Shoes {
  final UniqueID id;
  final String title;
  final String type;
  final String both;
  final String side;
  final String back;
  final String date;
  Shoes({
    required this.id,
    required this.title,
    required this.type,
    required this.both,
    required this.side,
    required this.back,
    required this.date,
  });

  factory Shoes.empty() {
    return Shoes(
      id: UniqueID(),
      title: "",
      back: "",
      type: "",
      both: "",
      side: "",
      date: "",
    );
  }

  Shoes copyWith({
    UniqueID? id,
    String? name,
    String? type,
    String? both,
    String? side,
    String? back,
    String? date,
  }) {
    return Shoes(
      id: id ?? this.id,
      title: name ?? this.title,
      type: type ?? this.type,
      both: both ?? this.both,
      side: side ?? this.side,
      back: back ?? this.back,
      date: date ?? this.date,
    );
  }
}
