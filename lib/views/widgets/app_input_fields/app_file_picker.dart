// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart'; // ✅ file_picker এর বদলে image_picker
// import 'package:reusable_editor/view_models/generic_cubits/field_cubit/field_cubit.dart';
//
// class AppFilePicker extends StatelessWidget {
//   final FieldCubit<File> cubit;
//   final String label;
//
//   // নোট: image_picker এ custom extension ফিল্টারিং সরাসরি ওভাবে কাজ করে না,
//   // তবে আপনি ImageSource (ক্যামেরা/গ্যালারি) কন্ট্রোল করতে পারবেন।
//   final ImageSource source;
//
//   const AppFilePicker({
//     super.key,
//     required this.cubit,
//     required this.label,
//     this.source = ImageSource.gallery, // ডিফল্ট হিসেবে গ্যালারি সেট করা
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // ImagePicker এর একটি ইন্সট্যান্স তৈরি করে নেওয়া হলো
//     final ImagePicker picker = ImagePicker();
//
//     return BlocBuilder<FieldCubit<File>, FieldState<File>>(
//       bloc: cubit,
//       builder: (_, state) => ListTile(
//         title: Text(label),
//         subtitle: Text(
//           state.value?.path.split('/').last ?? 'No file selected',
//           overflow: TextOverflow.ellipsis,
//         ),
//         trailing: const Icon(Icons.image),
//         // আইকন পরিবর্তন করে ইমেজ দেওয়া হলো
//         onTap: () async {
//           // image_picker দিয়ে ফাইল (XFile) পিক করা হচ্ছে
//           final XFile? pickedFile = await picker.pickImage(
//             source: source,
//             // imageQuality: 85, // চাইলে ইমেজের কোয়ালিটি বা সাইজ কম্প্রেস করতে পারেন
//           );
//
//           if (pickedFile != null) {
//             // XFile কে dart:io এর File এ কনভার্ট করে Cubit-এ পাঠানো হচ্ছে
//             final file = File(pickedFile.path);
//             cubit.onChanged(file);
//           }
//         },
//       ),
//     );
//   }
// }
//
//
// import 'dart:io';
//
// // import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:reusable_editor/view_models/generic_cubits/field_cubit/field_cubit.dart';
//
// // ✅ File Picker
// class AppFilePicker extends StatelessWidget {
//   final FieldCubit<File> cubit;
//   final String label;
//   final List<String>? allowedExtensions;
//   final bool allowMultiple;
//
//   const AppFilePicker({
//     super.key,
//     required this.cubit,
//     required this.label,
//     this.allowedExtensions,
//     this.allowMultiple = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FieldCubit<File>, FieldState<File>>(
//       bloc: cubit,
//       builder: (_, state) => ListTile(
//         title: Text(label),
//         subtitle: Text(
//           state.value?.path.split('/').last ?? 'No file selected',
//           overflow: TextOverflow.ellipsis,
//         ),
//         trailing: const Icon(Icons.attach_file),
//         onTap: () async {
//           final result = await FilePicker.pickFiles(
//             allowMultiple: allowMultiple,
//             type: allowedExtensions == null ? FileType.any : FileType.custom,
//             allowedExtensions: allowedExtensions,
//           );
//           if (result != null && result.files.isNotEmpty) {
//             final file = File(result.files.single.path!);
//             cubit.onChanged(file);
//           }
//         },
//       ),
//     );
//   }
// }
