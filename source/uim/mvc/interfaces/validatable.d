module uim.mvc.interfaces.validatable;

import uim.mvc;
@safe:

// Describes objects that can be validated by passing a Validator object.
interface IValidatable {
  /**
    * Validates the internal properties using a validator object and returns any
    * validation errors found.
    *
    * aValidator - The validator to use when validating the entity.
    */
  Json validate(DValidator aValidator);
}
