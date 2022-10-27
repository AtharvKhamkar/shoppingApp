import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:store_api_flutter_course/models/product_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.id});
  final String id;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductModel? productModel;
  Future<void> getProductInfo() async {
    productModel = await APIHandler.getProductById(id: widget.id);
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: productModel == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      const BackButton(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productModel!.category.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Text(
                                    productModel!.title.toString(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: RichText(
                                    text: TextSpan(
                                        text: '\$',
                                        style: const TextStyle(
                                          fontSize: 25,
                                          color: Colors.lightBlueAccent,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: productModel!.price
                                                  .toString(),
                                              style: TextStyle(
                                                  color: lightTextColor,
                                                  fontWeight: FontWeight.bold))
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.4,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return FancyShimmerImage(
                              width: double.infinity,
                              imageUrl: productModel!.images![index].toString(),
                              boxFit: BoxFit.contain,
                            );
                          },
                          autoplay: true,
                          itemCount: 3,
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              productModel!.description.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
