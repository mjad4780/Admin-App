import '../../../../models/response_coupon/datum.dart';
import 'add_coupon_form.dart';
import 'couponDataRow.dart';
import '../../../../core/function/showAddForm.dart';
import '../../../../utility/constants.dart';
import 'package:flutter/material.dart';

class CouponListSection extends StatelessWidget {
  const CouponListSection({
    Key? key,
    required this.coupon,
  }) : super(key: key);
  final List<Datum> coupon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Coupons",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
              width: double.infinity,
              child: DataTable(
                columnSpacing: defaultPadding,
                // minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text("Coupon Name"),
                  ),
                  DataColumn(
                    label: Text("MaxUser"),
                  ),
                  DataColumn(
                    label: Text("StartDate"),
                  ),
                  DataColumn(
                    label: Text("EndDate"),
                  ),
                  DataColumn(
                    label: Text("Edit"),
                  ),
                  DataColumn(
                    label: Text("Delete"),
                  ),
                ],
                rows: List.generate(
                  coupon.length,
                  (index) => couponDataRow(
                    coupon[index],
                    index + 1,
                    edit: () {
                      showAddForm(
                          context,
                          'Edit coupon',
                          CouponSubmitForm(
                            coupon: coupon[index],
                          ));
                    },
                    delete: () {
                      //TODO: should complete call deleteCoupon
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
