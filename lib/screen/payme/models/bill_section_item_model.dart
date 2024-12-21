import 'dart:ui';

class BillSectionItemModel {
  final String title;
  final String iconImage;
  final Color color;

  BillSectionItemModel({
    required this.title,
    required this.iconImage,
    required this.color,
  });

  // copyWith method
  BillSectionItemModel copyWith({
    String? title,
    String? iconImage,
    Color? color,
  }) {
    return BillSectionItemModel(
      title: title ?? this.title,
      iconImage: iconImage ?? this.iconImage,
      color: color ?? this.color,
    );
  }
}
