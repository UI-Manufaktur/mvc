module uim.mvc.views.components.accordions.themes;

@safe:
import uim.mvc;

class DAPPAccordionThemes : DAPPAccordion {
  mixin(ViewComponentThis!("APPAccordionThemes"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    
    this
      .id("accordion-themes"); 
  }
}
mixin(ViewComponentCalls!("APPAccordionThemes"));
