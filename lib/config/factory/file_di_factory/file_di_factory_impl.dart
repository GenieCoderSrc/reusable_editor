// import 'package:reusable_editor/config/di/file_register_get_it_di_fire_storage_data_source.dart';
// import 'package:reusable_editor/config/di/file_register_get_it_di_rest_api_data_source.dart';
// import 'package:reusable_editor/config/di/file_use_cases_register_get_it_di.dart';
// import 'package:reusable_editor/enums/file_data_source_type.dart';
//
// import 'i_file_di_factory/i_di_factory.dart';
//
// class FileDiFactoryImpl implements IFileDiFactory {
//   final IFileDataSource iFileDataSource;
//
//   FileDiFactoryImpl({required this.iFileDataSource}) {
//     final FileDataSourceType type = iFileDataSource.type;
//     switch (type) {
//       case FileDataSourceType.fireStorage:
//         fileRegisterGetItDIFireStorageDataSource();
//         break;
//       case FileDataSourceType.server:
//         fileRegisterGetItDiRestApiDataSource();
//         break;
//       default:
//         fileRegisterGetItDIFireStorageDataSource();
//     }
//
//     // register use cases
//     fileUseCasesRegisterGetItDI();
//   }
// }
