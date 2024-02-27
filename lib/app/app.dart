import 'package:todo_stack/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:todo_stack/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:todo_stack/ui/views/home/home_view.dart';
import 'package:todo_stack/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_stack/ui/views/todo/todo_view.dart';
import 'package:todo_stack/ui/views/todo_list/todo_list_view.dart';
import 'package:todo_stack/ui/views/text_reverse/text_reverse_view.dart';
import 'package:todo_stack/services/stripe_service.dart';
import 'package:todo_stack/ui/bottom_sheets/alert/alert_sheet.dart';
import 'package:todo_stack/ui/dialogs/error/error_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: TodoView),
    MaterialRoute(page: TodoListView),
    MaterialRoute(page: TextReverseView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: StripeService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: AlertSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ErrorDialog),
// @stacked-dialog
  ],
)
class App {}
