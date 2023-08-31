import 'package:flutter/material.dart';
import 'package:hamon/core/app_export.dart';

class CartButton extends StatefulWidget {
  final int? qty;

  CartButton({
    super.key,
    this.qty=0,
  });

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 69,
        height: 25,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color:Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              SizedBox(
                width: 1.66.w,
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  ImageConstant.cartDec,
                  width: 14,
                  height: 14,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Text(
            '${widget.qty}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 11.66.sp,
              fontFamily: 'Podkova',
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(children: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                ImageConstant.cartInc,
                width: 14,
                height: 14,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 1.66.w,
            )
          ])
        ]));
  }
}
