import 'dart:io';
import 'package:flutter/material.dart';

class CategoryImageCard extends StatelessWidget {
  final String labelText;
  final String? imageUrlForUpdateImage;
  final File? imageFile;
  final VoidCallback onTap;
  final String ifcondition;
  const CategoryImageCard({
    super.key,
    required this.labelText,
    this.imageFile,
    required this.onTap,
    this.imageUrlForUpdateImage,
    required this.ifcondition,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 130,
          width: size.width * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Align(alignment: Alignment.topLeft, child: Text('data')),
              if (imageFile != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    imageFile!,
                    width: double.infinity,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                )
              else if (imageUrlForUpdateImage != ifcondition)
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrlForUpdateImage ?? '',
                      width: double.infinity,
                      height: 80,
                      fit: BoxFit.cover,
                    ))
              else
                Icon(Icons.camera_alt, size: 50, color: Colors.grey[600]),
              const SizedBox(height: 8),
              Text(
                labelText,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
