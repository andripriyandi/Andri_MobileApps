import 'package:component/theme/theme.dart';
import 'package:data/models/response/response.dart';
import 'package:dependencies/cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:services/extension/int_extension.dart';

class CartItem extends StatefulWidget {
  final DataProduct data;
  const CartItem({super.key, required this.data});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int qty = 1;

  @override
  void initState() {
    super.initState();
    qty = widget.data.qty ?? 1;
  }

  void _incrementCounter() async {
    setState(() {
      qty++;

      widget.data.qty = qty;
    });
  }

  void _decrementCounter() async {
    if (qty == 1) {
      qty = 1;
    } else {
      setState(() {
        qty--;
        widget.data.qty = qty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: widget.data.picture ?? '-',
              errorWidget: (context, url, error) => Container(
                height: 80,
                width: 80,
                color: kGreyColor.withOpacity(0.2),
                child: const Center(
                  child: Text(
                    'No Image',
                  ),
                ),
              ),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: kShimmerColor),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            margin: EdgeInsets.zero,
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.name ?? '-',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Rp. ${int.parse(widget.data.price ?? '0').toCurrencyFormat()}',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      ' / porsi',
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: _decrementCounter,
                  icon: Icon(
                    Icons.indeterminate_check_box_outlined,
                    color: kPrimaryColor,
                  ),
                ),
                Text(qty.toString()),
                IconButton(
                  onPressed: _incrementCounter,
                  icon: Icon(
                    Icons.add_box_rounded,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
