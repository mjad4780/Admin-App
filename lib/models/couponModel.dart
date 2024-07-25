class CouponModel {
  int? couponId;
  String? couponName;
  int? couponCount;
  int? couponDiscount;
  String? startdate;
  String? enddata;
  String? maxuser;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDiscount,
      this.startdate,
      this.enddata,
      this.maxuser});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponDiscount = json['coupon_discount'];
    startdate = json['coupon_data'];
    maxuser = json['copon_maxuser'];
    enddata = json['copon_endDate'];
  }
}
