import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../domain/Entitys/shoes.dart';
import '../../domain/Entitys/uuid.dart';

class ShoesModel extends Equatable {
  final String id;
  final String modell;
  final String name;
  final String brand;
  final String desc;
  int? views;
  final List images;
  final String sku;
  final String releaseDate;
  ShoesModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.desc,
    required this.sku,
    required this.modell,
    required this.releaseDate,
    this.views,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'brand': brand,
      'desc': desc,
      'sku': sku,
      'modell': modell,
      'views': views,
      'images': images,
      'releaseDate': releaseDate,
    };
  }

  factory ShoesModel.fromMap(Map<String, dynamic> map) {
    return ShoesModel(
      id: "",
      name: map['name'],
      brand: map['brand'],
      desc: map['desc'],
      sku: map['sku'],
      modell: map['modell'],
      views: map['views'],
      images: List<String>.from(map['images']),
      releaseDate: map['releaseDate'],
    );
  }

  ShoesModel copyWith({
    String? id,
    String? name,
    String? brand,
    String? desc,
    String? sku,
    String? modell,
    int? views,
    List<String>? images,
    String? releaseDate,
  }) {
    return ShoesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      desc: desc ?? this.desc,
      sku: sku ?? this.sku,
      views: views ?? this.views,
      images: images ?? this.images,
      releaseDate: releaseDate ?? this.releaseDate,
      modell: modell ?? this.modell,
    );
  }

  factory ShoesModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc, String id) {
    return ShoesModel.fromMap(doc.data()).copyWith(id: doc.id);
  }

  factory ShoesModel.fromSnapshot(DocumentSnapshot snapshot) {
    ShoesModel shoesModel = ShoesModel(
      id: snapshot.id,
      name: snapshot['name'],
      brand: snapshot['brand'],
      desc: snapshot['desc'],
      sku: snapshot['sku'],
      modell: snapshot['modell'],
      views: snapshot['views'],
      images: List<String>.from(snapshot['images']),
      releaseDate: snapshot['releaseDate'],
    );
    return shoesModel;
  }

  Shoes toDomain() {
    return Shoes(
      id: UniqueID.fromUniqueString(id),
      name: name,
      brand: brand,
      desc: desc,
      sku: sku,
      modell: modell,
      views: views,
      images: images,
      releaseDate: releaseDate,
    );
  }

  factory ShoesModel.fromDomain(Shoes shoesItem) {
    return ShoesModel(
        id: shoesItem.id.value,
        name: shoesItem.name,
        brand: shoesItem.brand,
        desc: shoesItem.desc,
        sku: shoesItem.sku,
        modell: shoesItem.modell,
        releaseDate: shoesItem.releaseDate,
        images: shoesItem.images);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        brand,
        desc,
        sku,
        modell,
        views,
        images,
        releaseDate,
      ];
}
