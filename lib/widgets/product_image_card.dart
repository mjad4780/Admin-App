import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductImageCard extends StatelessWidget {
  final String labelText;
  final String? imageUrlForUpdateImage;
  final File? imageFile;
  final VoidCallback onTap;
  final VoidCallback? onRemoveImage;
  final String ifcondition;
  final double? size;
  const ProductImageCard({
    super.key,
    required this.labelText,
    this.imageFile,
    this.size,
    required this.onTap,
    this.imageUrlForUpdateImage,
    this.onRemoveImage,
    required this.ifcondition,
  });

  @override
  Widget build(BuildContext context) {
    var size1 = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          child: Container(
            height: 130,
            width: size ?? size1.width * 0.10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (imageFile != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: kIsWeb
                          ? Image.network(
                              imageFile?.path ?? '',
                              width: double.infinity,
                              height: 80,
                              fit: BoxFit.scaleDown,
                            )
                          : Image.file(
                              imageFile!,
                              width: double.infinity,
                              height: 80,
                              fit: BoxFit.scaleDown,
                            ),
                    )
                  else if (imageUrlForUpdateImage != ifcondition)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrlForUpdateImage ?? '',
                        width: double.infinity,
                        height: 80,
                        fit: BoxFit.scaleDown,
                      ),
                    )
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
        ),
        if (imageFile != null && onRemoveImage != null)
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
              onPressed: onRemoveImage,
            ),
          ),
      ],
    );
  }
}
