module uim.mvc.interfaces;

@safe:
import uim.mvc;

interface IAPPWithEntities {  
  @property DEntity[] entities();
  // @property O entities(this O)(DEntity[] myEntities);
  @property void entities(DEntity[] myEntities);
}

interface IAPPWithEntity {  
  @property DEntity entity();
  @property O entity(this O)(DEntity myEntity);
}