module uim.mvc.interfaces.validatoraware;

import uim.mvc;
@safe:

// Provides methods for managing multiple validators.
interface IValidatorCollection {
  /**
    * Returns the validation rules tagged with aName.
    *
    * If a aName argument has not been provided, the default validator will be returned.
    * You can configure your default validator name in a `DEFAULT_VALIDATOR`
    * class constant.
    *
    * @param string|null $name The name of the validation set to return.
    * @return uim.cake.validations.Validator
    */
  IValidator validator(string aName = null);

  /**
    * This method stores a custom validator under the given name.
    *
    * @param string aName The name of a validator to be set.
    * @param uim.cake.validations.Validator $validator Validator object to be set.
    * @return this
    */
  IValidatorCollection validator(string aName, IValidator aValidator);

  /**
    * Checks whether a validator has been set.
    *
    * @param string aName The name of a validator.
    */
  bool hasValidator(string aName);
}
