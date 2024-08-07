// import '../logic/cubit/dashboard_cubit.dart';
// import '../logic/cubit_d/dashboard_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../utility/constants.dart';
// import 'package:flutter/material.dart';

// import 'add_product_form.dart';
// import 'productDataRow.dart';

// class ProductListSection extends StatelessWidget {
//   const ProductListSection({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Builder(builder: (context) {
//       var dashpord = context.read<DashboardCubit>();

//       return BlocProvider.value(
//         value: dashpord,
//         child: Container(
//           padding: const EdgeInsets.all(defaultPadding),
//           decoration: const BoxDecoration(
//             color: secondaryColor,
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "All Products",
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               SizedBox(
//                   width: double.infinity,
//                   child: DataTable(
//                     columnSpacing: defaultPadding,
//                     // minWidth: 600,
//                     columns: const [
//                       DataColumn(
//                         label: Text("Product Name"),
//                       ),
//                       DataColumn(
//                         label: Text("Category"),
//                       ),
//                       DataColumn(
//                         label: Text(" Items Count"),
//                       ),
//                       DataColumn(
//                         label: Text("Price"),
//                       ),
//                       DataColumn(
//                         label: Text("Edit"),
//                       ),
//                       DataColumn(
//                         label: Text("Delete"),
//                       ),
//                     ],
//                     rows: List.generate(
//                       context.read<DashboardCubit>().products.length,
//                       (index) => productDataRow(
//                         context.read<DashboardCubit>().products[index],
//                         edit: () {
//                           showAddProductForm(context,
//                               context.read<DashboardCubit>().products[index]);
//                         },
//                         delete: () {
//                           //TODO: should complete call deleteProduct
//                         },
//                       ),
//                     ),
//                   )),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
