import '../../../../models/response_coupon/datum.dart';
import 'couponDataRow.dart';
import '../../../../utility/constants.dart';
import 'package:flutter/material.dart';

class CouponListSection extends StatelessWidget {
  const CouponListSection({
    super.key,
    required this.coupon,
  });
  final List<Datum> coupon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
              child: SingleChildScrollView(
                scrollDirection: MediaQuery.sizeOf(context).width >= 750
                    ? Axis.vertical
                    : Axis.horizontal,
                child: DataTable(
                  columnSpacing: defaultPadding,
                  // minWidth: 600,
                  columns: const [
                    DataColumn(
                      label: Text("Coupon Name"),
                    ),
                    DataColumn(
                      label: Text("discount"),
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
                  ],
                  rows: List.generate(
                    coupon.length,
                    (index) => couponDataRow(
                      coupon[index],
                      index + 1,
                      edit: () {
                        // showAddForm(
                        //     context,
                        //     'Edit coupon',
                        //     CouponSubmitForm(
                        //       coupon: coupon[index],
                        //     ));
                      },
                      delete: () {
                        //TODO: should complete call deleteCoupon
                      },
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
