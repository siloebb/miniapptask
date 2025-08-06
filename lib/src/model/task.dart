import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ColoredTag {
  newTag,
  old,
  hot;

  Color get color {
    switch (this) {
      case ColoredTag.newTag:
        return Colors.green;
      case ColoredTag.old:
        return Colors.blue;
      case ColoredTag.hot:
        return Colors.red;
    }
  }
}

class Task extends Equatable {
  final String id;
  final String title;
  final bool isFavorite;
  final ColoredTag tag;
  final DateTime timestamp;

  Task({
    required this.id,
    required this.title,
    required this.isFavorite,
    this.tag = ColoredTag.newTag,
    required this.timestamp,
  }) ;

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      isFavorite: json['isFavorite'],
      tag: ColoredTag.values[json['tag']],
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),      
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'isFavorite': isFavorite,
    'tag': tag.index,
    'timestamp': timestamp.toIso8601String(),
  };

  copyWith({
    String? id,
    String? title,
    bool? isFavorite,
    ColoredTag? tag,
    DateTime? timestamp,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
      tag: tag ?? this.tag,
      timestamp: timestamp ?? this.timestamp,
    );
  } 

  @override
  List<Object?> get props => [id, title, isFavorite, tag, timestamp];
}
