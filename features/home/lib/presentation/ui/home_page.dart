import 'package:component/theme/theme.dart';
import 'package:component/utils/sliver_grid_rasio_custom.dart';
import 'package:component/widgets/cart_item.dart';
import 'package:component/widgets/product_item.dart';
import 'package:data/models/response/response.dart';
import 'package:data/other/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/cached_network_image/cached_network_image.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:dependencies/infinity_scroll_pagination/infinity_scroll_pagination.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/bloc/home_bloc.dart';

import 'package:services/extension/int_extension.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _homeBloc = locator<HomeBloc>();

  List<DataProduct>? _records = [];

  final TextEditingController totalBayarController = TextEditingController();
  final TextEditingController kemablianController = TextEditingController();

  ValueNotifier<List<DataProduct>> carts = ValueNotifier<List<DataProduct>>([]);

  final PagingController<int, DataProduct> _pagingController =
      PagingController(firstPageKey: 1);

  int currentPage = 1;
  int cartCount = 0;

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _homeBloc.add(
        GetProductEvent(
          page: pageKey,
        ),
      );
    });

    _pagingController.refresh();
  }

  void _dialogCharge() {
    showDialog(
        context: context,
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable: carts,
            builder: (context, value, child) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(16),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            totalBayarController.clear();
                            kemablianController.clear();
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close),
                        ),
                      ),
                      Text(
                        'Detail Pesanan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Column(
                          children: List.generate(value.length, (index) {
                            final obj = value[index];

                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      imageUrl: obj.picture ?? '-',
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        height: 60,
                                        width: 60,
                                        color: kGreyColor.withOpacity(0.2),
                                        child: const Center(
                                          child: Text(
                                            'No Image',
                                          ),
                                        ),
                                      ),
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Container(color: kShimmerColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          obj.name ?? '-',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text(
                                              'Rp. ${int.parse(obj.price ?? '0').toCurrencyFormat()}',
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
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'x${obj.qty}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Total                :',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              int.parse(value
                                      .map((e) =>
                                          int.parse(e.price ?? '0') *
                                          int.parse('${e.qty}'))
                                      .sum
                                      .toString())
                                  .toCurrencyFormat(),
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Uang Dibayar :',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: totalBayarController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                filled: true,
                              ),
                              onChanged: (val) async {
                                var total = int.parse(value
                                    .map((e) =>
                                        int.parse(e.price ?? '0') *
                                        int.parse('${e.qty}'))
                                    .sum
                                    .toString());
                                int kembalian = int.parse(val) - total;

                                kemablianController.text =
                                    kembalian.toCurrencyFormat();
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text('Kembalian      :'),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: kemablianController,
                              readOnly: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                filled: true,
                                fillColor: Colors.green[50],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          totalBayarController.clear();
                          kemablianController.clear();
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kPrimaryColor,
                          ),
                          child: const Center(
                            child: Text(
                              'Cetak Struk',
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
              );
            },
          );
        });
  }

  void _bottomSheetCart() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return ValueListenableBuilder<List<DataProduct>>(
              valueListenable: carts,
              builder: (context, value, child) {
                return IntrinsicHeight(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 22,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              top: BorderSide(color: kPrimaryColor, width: 2)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Badge(
                                        label: Text(value.length.toString()),
                                        child: Icon(
                                          Icons.shopping_cart,
                                          color: kPrimaryColor.withOpacity(0.3),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Rp. ${int.parse(value.map((e) => int.parse(e.price ?? '0') * int.parse('${e.qty}')).sum.toString()).toCurrencyFormat()}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () => _dialogCharge(),
                                  child: Container(
                                    width: 120,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: kPrimaryColor,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Charge',
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
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 200,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: value.length,
                                itemBuilder: (context, index) {
                                  final obj = value[index];
                                  return CartItem(data: obj);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -10,
                        left: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                hintText: 'Cari Menu',
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: kPrimaryColor,
                )),
          ),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            final status = state.statusProduct.status;
            final data = state.statusProduct.data?.listProduct;

            if (status.isHasData) {
              try {
                _records = data;
                var offset = 1;
                final isLastPage = currentPage == offset;

                if (isLastPage) {
                  _pagingController.appendLastPage(_records!);
                } else {
                  currentPage++;
                  _pagingController.appendPage(_records!, currentPage);
                }
              } catch (e) {
                debugPrint("error $e");
              }
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: PagedGridView<int, DataProduct>(
                    pagingController: _pagingController,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 22),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      height: 250,
                    ),
                    builderDelegate: PagedChildBuilderDelegate<DataProduct>(
                      itemBuilder: (context, time, index) {
                        final obj = time;
                        return ProductItem(
                          onTapOrder: () async {
                            final ids = <dynamic>{};

                            carts.value.add(obj);
                            carts.value.retainWhere((x) => ids.add(x.id));

                            setState(() {
                              cartCount = carts.value.length;
                            });
                          },
                          data: obj,
                        );
                      },
                      noItemsFoundIndicatorBuilder: (context) {
                        if (_pagingController.value.status ==
                            PagingStatus.ongoing) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: ValueListenableBuilder<List<DataProduct>>(
          valueListenable: carts,
          builder: (context, value, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 22,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(color: kPrimaryColor, width: 2)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Badge(
                                  label: value.isNotEmpty
                                      ? Text(cartCount.toString())
                                      : null,
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: kPrimaryColor.withOpacity(0.3),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Rp. ${int.parse(value.map((e) => int.parse(e.price ?? '0' * int.parse('${e.qty}'))).sum.toString()).toCurrencyFormat()}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: _dialogCharge,
                            child: Container(
                              width: 120,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kPrimaryColor,
                              ),
                              child: const Center(
                                child: Text(
                                  'Charge',
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
                    Positioned(
                      top: -10,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _bottomSheetCart(),
                        child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
