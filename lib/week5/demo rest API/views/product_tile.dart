import 'package:flutter/material.dart';
import 'package:code/week5/demo%20rest%20API/models/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(this.product, {super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.imageLink,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '\$ ${product.price}',
              style: const TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
