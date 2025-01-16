import 'package:e_delivery_app/Core/widgets/loading/cart_loading_view.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/cart_view.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/cart_view_failure.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/empty_cart_view.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBuilder extends StatefulWidget {
  const CartViewBuilder({super.key});

  @override
  State<CartViewBuilder> createState() => _CartViewBuilderState();
}

class _CartViewBuilderState extends State<CartViewBuilder> {
  @override
  void initState() {
    BlocProvider.of<GetCartCubit>(context).getCart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartState>(
      builder: (context, state) {
        if (state is GetCartEmpty) {
          return const EmptyCartView();
        } else if (state is GetCartFailure) {
          return CartViewFailure(
            errMessage: state.errMessage,
          );
        } else if (state is GetCartSuccess) {
          return CartView(
            cartModel: state.cartModel!,
          );
        } else {
          return const CartLoadingView();
        }
      },
    );
  }
}
