import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String name;
  final String desc;
  final String image;
  final double price;
  final String type;
  final bool available;
  const Product({
    required this.id,
    required this.title,
    required this.name,
    required this.desc,
    required this.image,
    required this.price,
    required this.type,
    required this.available,
  });

  factory Product.empty() {
    return const Product(
      id: '',
      title: '',
      name: '',
      desc: '',
      image: '',
      price: 0.0,
      type: '',
      available: false,
    );
  }

  Product copyWith({
    String? id,
    String? title,
    String? name,
    String? desc,
    String? image,
    double? price,
    String? type,
    bool? available,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      price: price ?? this.price,
      type: type ?? this.type,
      available: available ?? this.available,
    );
  }

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    Product proucts = Product(
      id: snapshot.id,
      title: snapshot['title'],
      name: snapshot['name'],
      desc: snapshot['desc'],
      image: snapshot['image'],
      price: snapshot['price']?.toDouble(),
      type: snapshot['type'],
      available: snapshot['available'],
    );
    return proucts;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'name': name,
      'desc': desc,
      'image': image,
      'price': price,
      'type': type,
      'available': available,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'] as String,
      name: map['name'] as String,
      desc: map['desc'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      type: map['type'] as String,
      available: map['available'] as bool,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      name,
      desc,
      image,
      price,
      type,
      available,
    ];
  }
}
