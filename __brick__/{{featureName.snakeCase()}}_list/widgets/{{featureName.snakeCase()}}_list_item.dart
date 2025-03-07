import 'package:flutter/material.dart';
import 'package:list/{{featureName.snakeCase()}}_list/{{featureName.snakeCase()}}_list_cubit.dart';

class {{featureName.pascalCase()}}ListItem extends StatelessWidget {
  const {{featureName.pascalCase()}}ListItem({
    super.key,
    required this.item,
  });

  final {{featureName.pascalCase()}}Model item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.content),
    );
  }
}
