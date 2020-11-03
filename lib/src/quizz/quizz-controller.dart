
import 'package:mvc_pattern/mvc_pattern.dart';

class QuizzController extends ControllerMVC {

factory QuizzController() {
    _this = QuizzController._();
    return _this;

}
static QuizzController _this;

QuizzController._();

static QuizzController get con => _this;

String pageName = 'Quizz';
}
            