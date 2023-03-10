module uim.mvc.interfaces.pagecontroller;

@safe:
import uim.mvc;

interface IPageController: IController {
  DETBBase database();
  string[] sessionData();
}