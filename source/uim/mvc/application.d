module uim.mvc.application;

@safe:
import uim.mvc;

interface IMVCApplication : IMVCBase {
  
}

class DMVCApplication : DMVCBase, IMVCApplication { 
  this() { initialize; }

  
}
