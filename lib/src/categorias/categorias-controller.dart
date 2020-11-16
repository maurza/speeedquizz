
import 'package:mvc_pattern/mvc_pattern.dart';

class CategoriasController extends ControllerMVC {

factory CategoriasController() {
    _this = CategoriasController._();
    return _this;

}
static CategoriasController _this;

CategoriasController._();

static CategoriasController get con => _this;

String pageName = 'Categorias';
}
            