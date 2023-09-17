import 'dart:convert';

class Product {
  final String name;
  final String form;
  final String strength;

  final String companyName;

  Product({
    required this.name,
    required this.form,
    required this.strength,
    required this.companyName,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': form,
      'quantity': strength,
      'images': companyName,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      form: map['form'] ?? '',
      strength: map['strength'] ?? '',
      companyName: map['company_name'] ?? '',
    );
  }
}
