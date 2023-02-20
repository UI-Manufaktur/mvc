module uim.mvc.entities.session;

@safe:
import uim.mvc;

class DSessionEntity : DEntity {
  mixin(EntityThis!("OMOperatingUnitContactEntity"));
  
  override void initialize() {
    super.initialize;
  }
}
