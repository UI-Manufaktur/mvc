/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.form;

import uim.mvc;
@safe:

/**
 * Form abstraction used to create forms not tied to ORM backed models,
 * or to other permanent datastores. Ideal for implementing forms on top of
 * API services, or contact forms.
 */
class DForm : DViewComponent {  // : IEventListener, IEventDispatcher, IValidatorCollection
  mixin(ViewComponentThis!("Form"));

  // Name of default validation set.
  const string DEFAULT_VALIDATOR = "default";

  // The alias this object is assigned to validators as.
  const string VALIDATOR_PROVIDER_NAME = "form";

  // The name of the event dispatched when a validator has been built.
  const string BUILD_VALIDATOR_EVENT = "Form.buildValidator";

  /*   this(DEventManager newEventManager = null) {
        if (newEventManager) this.eventManager(newEventManager);
        // $this->getEventManager()->on($this);

         if (method_exists($this, "_buildValidator")) {
            deprecationWarning(
                static::class . " implements `_buildValidator` which is no longer used. " .
                "You should implement `buildValidator(Validator $validator, string $name): void` " .
                "or `validationDefault(Validator $validator): Validator` instead."
            );
        }
     }*/ 

  override void initialize(Json configSettings = Json(null)) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DForm~"::DForm("~this.className~"):initialize"); }  
    super.initialize(configSettings);    
    version(test_uim_mvc) { 
      debug writeln("In ", __MODULE__, "/", __LINE__); 
    }
 
    this
      .id(name~"_"~to!string(uniform(0, 100_000)))
      .header(FormHeader)
      .content(FormContent)
      .crudMode(CRUDModes.Read)
      .method("post");
  
  }

/*     mixin(OProperty!("DEventManager", "eventManager"));

    // Schema class.
    protected string _schemaClass; //  = Schema::class;

    // The errors if any
    protected string[] _errors; */

  // #region Properties
    mixin(OProperty!("string[string]", "defaults"));
    mixin(OProperty!("string[]", "fields"));
    // mixin(OProperty!("DMVCPanes", "panes"));
    mixin(MVCParameter!("action"));

    mixin(MVCParameter!("method"));
    mixin(OProperty!("bool", "readonly"));
    // mixin(OProperty!("string", "rootPath"));

    mixin(OProperty!("CRUDModes", "crudMode"));

    mixin(MVCParameter!("entityName"));
    mixin(MVCParameter!("entitiesName"));
    mixin(MVCParameter!("headerTitle"));
    mixin(MVCParameter!("contentTitle"));
    mixin(MVCParameter!("footerTitle"));

    mixin(OProperty!("DFormHeader", "header"));
    mixin(OProperty!("DFormContent", "content"));
    mixin(OProperty!("DFormFooter", "footer"));
  // #endregion Properties

/*   DEntityBase _DEntityBase", "entityBase; 
  O DEntityBase", "entityBase(this O)(DEntityBase aDatabase) { 
    _DEntityBase", "entityBase = aDatabase; 
    return cast(O)this; }

  DEntityBase DEntityBase", "entityBase() {
    if (_DEntityBase", "entityBase) { return _DEntityBase", "entityBase; } // has his own DEntityBase", "entityBase
    if (this.view && this.view.DEntityBase", "entityBase) { return this.view.DEntityBase", "entityBase; } // owner class has DEntityBase", "entityBase
    return null; // no DEntityBase", "entityBase found
  } */

  /**
    * Get the Form callbacks this form is interested in.
    *
    * The conventional method map is:
    *
    * - Form.buildValidator => buildValidator
    *
    * @return array<string, mixed>
    */
  /* DEvent[string] implementedEvents() {
        if (method_exists($this, "buildValidator")) {
          return [
              self::BUILD_VALIDATOR_EVENT => "buildValidator",
          ];
      }
 
        return null;
    } */



    // #region Schema
        // The schema used by this form.
        protected DFormSchema _schema;
        // Set the schema for this form.
        O setSchema(this O)(DFormSchema newSchema) {
            _schema = newSchema;
            return cast(O)this; }

        // Get the schema for this form.
        DFormSchema getSchema() {
        // all `_buildSchema()` when the schema
        /* * is first built. This hook method lets you configure the
        * schema or load a pre-defined one.
        */ // Has Schema?
        /*    if ($this->_schema === null) {
                _schema = $this->_buildSchema(new $this->_schemaClass());
            }
    */
            return _schema;
        }

        /**
        * Get/Set the schema for this form.
        *
        * This method will call `_buildSchema()` when the schema
        * is first built. This hook method lets you configure the
        * schema or load a pre-defined one.
        */
        DFormSchema schema(DFormSchema schema = null) {
        /*         deprecationWarning("Form::schema() is deprecated. Use setSchema() and getSchema() instead.");
            if ($schema !== null) {
                $this->setSchema($schema);
            }*/
            return getSchema();
        }
    // #endregion Schema

    /**
     * A hook method intended to be implemented by subclasses.
     *
     * You can use this method to define the schema using
     * the methods on {@link \Cake\Form\Schema}, or loads a pre-defined
     * schema from a concrete class.
     *
     * @param \Cake\Form\Schema $schema The schema to customize.
     * @return \Cake\Form\Schema The schema to use.
     */
/*     protected function _buildSchema(Schema $schema): Schema
    {
        return $schema;
    }
 */
    /**
     * Used to check if $data passes this form"s validation.
     *
     * @param array $data The data to check.
     * @param string|null $validator Validator name.
     * @return bool Whether the data is valid.
     * @throws \RuntimeException If validator is invalid.
     */
/*     public function validate(array $data, ?string $validator = null): bool
    {
        $this->_errors = $this->getValidator($validator ?: static::DEFAULT_VALIDATOR)
            ->validate($data);

        return count($this->_errors) === 0;
    } */

    /**
     * Get the errors in the form
     *
     * Will return the errors from the last call
     * to `validate()` or `execute()`.
     *
     * @return array Last set validation errors.
     */
/*     public function getErrors(): array
    {
        return $this->_errors;
    } */

    /**
     * Set the errors in the form.
     *
     * ```
     * $errors = [
     *      "field_name" => ["rule_name" => "message"]
     * ];
     *
     * $form->setErrors($errors);
     * ```
     *
     * @param array $errors Errors list.
     * @return $this
     */
/*     public function setErrors(array $errors)
    {
        $this->_errors = $errors;

        return $this;
    } */

    /**
     * Execute the form if it is valid.
     *
     * First validates the form, then calls the `_execute()` hook method.
     * This hook method can be implemented in subclasses to perform
     * the action of the form. This may be sending email, interacting
     * with a remote API, or anything else you may need.
     *
     * ### Options:
     *
     * - validate: Set to `false` to disable validation. Can also be a string of the validator ruleset to be applied.
     *   Defaults to `true`/`"default"`.
     *
     * @param array $data Form data.
     * @param array $options List of options.
     * @return bool False on validation failure, otherwise returns the
     *   result of the `_execute()` method.
     */
    /* public function execute(array $data, array $options = []): bool
    {
        $this->_data = $data;

        $options += ["validate" => true];

        if ($options["validate"] === false) {
            return $this->_execute($data);
        }

        $validator = $options["validate"] === true ? static::DEFAULT_VALIDATOR : $options["validate"];

        return $this->validate($data, $validator) ? $this->_execute($data) : false;
    } */

    /**
     * Hook method to be implemented in subclasses.
     * Used by `execute()` to execute the form"s action.
     * @param array $data Form data.
     */
         bool _execute(STRINGAA data) {
        return true; }

    // #region data 
        // Form"s data.
        protected STRINGAA _data;
        STRINGAA data() {
            return _data; }
        string data(string field) {
            if (field in _data) return _data[field];
            return null; }
        O data(this O)(STRINGAA values) {
            _data = values;
            return cast(O)this; }
        O data(this O)(string key, string value) {
            _data[key] = value;
            return cast(O)this; }
    // #endregion data 

    /**
     * Saves a variable or an associative array of variables for use inside form data.
     *
     * @param array|string $name The key to write, can be a dot notation value.
     * Alternatively can be an array containing key(s) and value(s).
     * @param mixed $value Value to set for var
     * @return $this
     */
    /* O set(this O)(string name, string value = null) {
         $write = $name;
        if (!is_array($name)) {
            $write = [$name => $value];
        }

        foreach ($write as $key => $val) {
            $this->_data = Hash::insert($this->_data, $key, $val);
        } 
        return cast(O)this;
    }*/ 

    /**
     * Get the printable version of a Form instance.
     *
     * @return array<string, mixed>
     */
    /* public function __debugInfo(): array
    {
        $special = [
            "_schema" => $this->getSchema()->__debugInfo(),
            "_errors" => $this->getErrors(),
            "_validator" => $this->getValidator()->__debugInfo(),
        ];

        return $special + get_object_vars($this);
    } */
  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DForm~":DForm("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

/*     foreach(comp; [this.header, this.content, this.footer]) {
      comp
        .crudMode(this.crudMode)
        .rootPath(this.rootPath)
        .title(headerTitle); 
    } */
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DForm~":DForm("~this.name~")::toH5");
    super.toH5(options);
    
    DBS5Col _col = BS5Col(["col-12"]);
    /* _col(
      H5Form(this.id, ["card"], ["method":method, "action":action], 
        this.header.toH5(options)~
        this.content.toH5(options)~
        this.footer.toH5(options)
      )); */
    
    return [_col].toH5;
  }  
}
mixin(ViewComponentCalls!("Form"));

version(test_uim_mvc) { unittest {
  assert(Form);

  assert(Form.entityName("Test").entityName == "Test");
  assert(Form.entitiesName("Test").entitiesName == "Test");
  assert(Form.headerTitle("Test").headerTitle == "Test");
  assert(Form.contentTitle("Test").contentTitle == "Test");
  assert(Form.footerTitle("Test").footerTitle == "Test");
}}