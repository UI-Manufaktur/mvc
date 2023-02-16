/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.interface_;

@safe:
import uim.mvc;

interface IView : IMVCObject {
  IController controller();
  O controller(this O)(DController newController);

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}