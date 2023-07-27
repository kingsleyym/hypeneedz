import 'package:hypeneedz/domain/Entitys/uuid.dart';

class Shoes {
  final UniqueID id;
  final String modell;
  final String name;
  final String brand;
  final String desc;
   int? views;
  final List images;
  final String sku;
  final String releaseDate;
  Shoes({
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

  factory Shoes.empty() {
    return Shoes(
      id: UniqueID(),
      name: "",
      modell: "",
      brand: "",
      desc: "",
      sku: "",
      views: 0,
      images: [],
      releaseDate: "",
    );
  }

  
  

  Shoes copyWith({
    UniqueID? id,
    String? name,
    String? brand,
    String? desc,
    String? sku,
    String? modell,
    int? views ,
    List? images,
    String? releaseDate,
  }) {
    return Shoes(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      desc: desc ?? this.desc,
      sku: sku ?? this.sku,
      views: views ?? this.views,
      images: images ?? this.images,
      modell: modell ?? this.modell,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }
}
