import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sgmasms/core/device/utils.dart';
import 'package:sgmasms/demo/demo_model.dart';
import 'package:sgmasms/demo/demo_state.dart';

class DemoBloc extends Cubit<DemoState> {
  DemoBloc() : super(InitialState()) {
    //addDataInDemoList
    addDataInList();
  }
  List<DemoList> demoList = <DemoList>[];
  List<String> menuList = [
    "Collection",
    "Best Selling",
    "Seasonal Offers",
    "Occasion Offer",
    "Deals"
  ];
  int checkedIndex = -1;

  void onBackBtnTap(BuildContext context) async {
    if (await Utils.isKeyboardVisible(context)) {
      // Keyboard is open, close it
      // ignore: use_build_context_synchronously
      Utils.hideKeyboard(context);
    } else {
      // Keyboard is not open, navigate back
      // ignore: use_build_context_synchronously
      context.pop();
    }
  }

  void onItemTap(int j, int index) {
    int tappedItem = j + (index * 3);
    checkedIndex = checkedIndex == tappedItem ? -1 : tappedItem;
    emit(LoadedState());
  }

  void addDataInList() {
    demoList.add(DemoList(
        title: "Natural Diamonds",
        image: "https://i.ibb.co/HgjT1rt/Image.png"));
    demoList.add(DemoList(
        title: "Lab-grown Diamonds",
        image: "https://i.ibb.co/HgjT1rt/Image.png"));
    demoList.add(DemoList(
        title: "Gemstone", image: "https://i.ibb.co/HgjT1rt/Image.png"));
    demoList.add(DemoList(
        title: "Jewellery", image: "https://i.ibb.co/HgjT1rt/Image.png"));
    demoList.add(DemoList(
        title: "Do it Yourself", image: "https://i.ibb.co/HgjT1rt/Image.png"));
    demoList.add(DemoList(
        title: "About Us", image: "https://i.ibb.co/HgjT1rt/Image.png"));
    demoList.add(DemoList(
        title: "Education", image: "https://i.ibb.co/HgjT1rt/Image.png"));
    emit(LoadedState());
  }
}

// class LoginBloc extends Cubit<LoginState> {
//   LoginBloc(this.loginUseCase) : super(InitialState()) {
//     // get data from storage
//     getLsData();
//   }
//   DateTime? lastPressed;
//   List<CancelToken> cancelTokens = [];
//   LoginUseCase loginUseCase;
//   TextEditingController usernameContrl = TextEditingController();
//   TextEditingController passwordContrl = TextEditingController();
//   bool isKeyboardOpen = false;
//   bool isHidePass = true;
//   bool isRemember = false;
//   bool isUsernameError = false;
//   bool isPasswordError = false;

//   @override
//   Future<void> close() {
//     // Cancel all ongoing Dio requests when the controller is closed
//     for (CancelToken cancelToken in cancelTokens) {
//       cancelToken.cancel();
//     }
//     return super.close();
//   }

//   void onBackBtnTap(BuildContext context) async {
//     if (await Utils.isKeyboardVisible(context)) {
//       // Keyboard is open, close it
//       // ignore: use_build_context_synchronously
//       Utils.hideKeyboard(context);
//     } else {
//       // Keyboard is not open, navigate back
//       // ignore: use_build_context_synchronously
//       context.pop();
//     }
//   }

//   void getLsData() async {
//     var username = await AppStorage.getData(Const.userDetails, Const.username);
//     var password = await AppStorage.getData(Const.userDetails, Const.password);
//     if (username != null && password != null) {
//       usernameContrl.text = username.toString();
//       passwordContrl.text = password.toString();
//     }
//   }

//   void toggleRemember(BuildContext context) async {
//     if (state is! LoadingState) {
//       if (usernameContrl.text.isNotEmpty && passwordContrl.text.isNotEmpty) {
//         isRemember = !isRemember;
//         if (isRemember) {
//           await AppStorage.setData(Const.userDetails, Const.username,
//               usernameContrl.text.trim().toString());
//           await AppStorage.setData(Const.userDetails, Const.password,
//               passwordContrl.text.trim().toString());
//         } else {
//           await AppStorage.remove(Const.userDetails, Const.username);
//           await AppStorage.remove(Const.userDetails, Const.password);
//         }
//         emit(InitialState());
//       } else {
//         AppHelper.showSnackBar(context, "All field is required");
//       }
//     }
//   }

//   void togglePass() {
//     if (state is! LoadingState) {
//       isHidePass = !isHidePass;
//       emit(InitialState());
//     }
//   }

//   void validateFiled(BuildContext context) {
//     if (state is! LoadingState) {
//       if (usernameContrl.text.isEmpty) {
//         isUsernameError = true;
//       }
//       if (passwordContrl.text.isEmpty) {
//         isPasswordError = true;
//       }
//       emit(InitialState());
//       if (usernameContrl.text.trim().isNotEmpty &&
//           passwordContrl.text.trim().isNotEmpty) {
//         isUsernameError = false;
//         isPasswordError = false;
//         // calling login api
//         loginApi(context);
//       }
//     }
//   }

//   loginApi(BuildContext context) async {
//     CancelToken cancelToken = CancelToken();
//     cancelTokens.add(cancelToken);
//     emit(LoadingState());
//     final result = await loginUseCase.execute(
//       usernameContrl.text.trim().toString(),
//       passwordContrl.text.trim().toString(),
//       cancelToken,
//     );
//     result.fold(
//       (failure) {
//         emit(ErrorState(failure.message));
//       },
//       (data) async {
//         // setup local storage
//         await storeDataInStorage(data);
//         // // ignore: use_build_context_synchronously
//         // context.read<DrawerBloc>().getLsData();
//         // go to next screen code
//         // ignore: use_build_context_synchronously
//         context.pushReplacementNamed(Routes.base);
//       },
//     );
//   }

//   storeDataInStorage(LoginModel data) async {
//     await AppStorage.setData(Const.userDetails, Const.isLoggedIn, true);
//     await AppStorage.setData(Const.userDetails, Const.authToken, data.token);
//     await AppStorage.setData(Const.userDetails, Const.userId, data.id);
//     await AppStorage.setData(Const.userDetails, Const.userRole, data.role);
//     await AppStorage.setData(
//         Const.userDetails, Const.firstName, data.firstname);
//     await AppStorage.setData(Const.userDetails, Const.lastName, data.lastname);
//     await AppStorage.setData(
//         Const.userDetails, Const.loggedInUser, data.username);
//     await AppStorage.setData(
//         Const.userDetails, Const.lastLogin, data.lastLogin);
//     ////////////////////////////////////////////////////////////////////////////
//     // store access rights
//     var accessData = [
//       {
//         "userAccess": {
//           "canView": data.access.userAccess.canView,
//           "canResetPassword": data.access.userAccess.canResetPassword,
//           "canCreate": data.access.userAccess.canCreate,
//           "canModify": data.access.userAccess.canModify,
//           "canActivate": data.access.userAccess.canActivate,
//           "canViewLoginHistory": data.access.userAccess.canViewLoginHistory,
//         },
//         "smartBoard": {
//           "canUpload": data.access.smartBoard.canUpload,
//           "canDelete": data.access.smartBoard.canDelete,
//         },
//         "batch": {
//           "canCreate": data.access.batch.canCreate,
//           "canUpdate": data.access.batch.canUpdate,
//           "canView": data.access.batch.canView,
//         },
//         "student": {
//           "canCreate": data.access.student.canCreate,
//           "canUpdate": data.access.student.canUpdate,
//           "canView": data.access.student.canView,
//           "canDownload": data.access.student.canDownload,
//         },
//         "attendance": {
//           "school": {
//             "canTakeAttendance":
//                 data.access.attendance.school.canTakeAttendance,
//             "canViewAttendance":
//                 data.access.attendance.school.canViewAttendance,
//           },
//           "chatralay": {
//             "canTakeAttendance":
//                 data.access.attendance.chatralay.canTakeAttendance,
//             "canViewAttendance":
//                 data.access.attendance.chatralay.canViewAttendance,
//           },
//           "customList": {
//             "canViewAttendance":
//                 data.access.attendance.customList.canViewAttendance,
//             "canTakeAttendance":
//                 data.access.attendance.customList.canTakeAttendance,
//           }
//         },
//         "room": {
//           "canCreate": data.access.room.canCreate,
//           "canUpdate": data.access.room.canUpdate,
//           "canView": data.access.room.canView,
//         },
//         "std": {
//           "canCreate": data.access.std.canCreate,
//           "canUpdate": data.access.std.canUpdate,
//           "canView": data.access.std.canView,
//         },
//       }
//     ];
//     await AppStorage.setData(Const.userDetails, Const.accessData, accessData);
//     // Retrieve data
//     // var storedData =
//     //     await AppStorage.getData(Const.userDetails, Const.accessData);
//     // debugPrint('Retrieved Data: $storedData');
//     // debugPrint("finalData => ${storedData[0]["userAccess"]["canView"]}");
//   }
// }
