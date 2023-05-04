import 'package:component/theme/theme.dart';
import 'package:data/models/response/response.dart';
import 'package:dependencies/cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:services/extension/int_extension.dart';

class ProductItem extends StatelessWidget {
  final DataProduct data;
  final Function()? onTapOrder;
  const ProductItem({
    super.key,
    required this.data,
    this.onTapOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: CachedNetworkImage(
              imageUrl: data.picture ?? '-',
              errorWidget: (context, url, error) => Container(
                height: 126,
                color: kGreyColor.withOpacity(0.2),
                child: const Center(
                  child: Text(
                    'No Image',
                  ),
                ),
              ),
              height: 126,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: kShimmerColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name ?? '-',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Rp. ${int.parse(data.price ?? '0').toCurrencyFormat()}',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      ' / porsi',
                      style: TextStyle(color: kGreyColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: onTapOrder,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kPrimaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        'Order',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
