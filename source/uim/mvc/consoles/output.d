/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.consoles.output;

@safe:
import uim.mvc;

class DOutputConsole : DConsole {
	mixin(ConsoleThis!("OutputConsole"));
	
	// Raw output constant - no modification of output text.
  const int RAW = 0;

  // Plain output - tags will be stripped.
  const int PLAIN = 1;

  // Color output - Convert known tags in to ANSI color escape codes.
  const int COLOR = 2;

  // text colors used in colored output.
  protected static int[string] _foregroundColors;
    
  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    _foregroundColors = [
      "black": 30,
      "red": 31,
      "green": 32,
      "yellow": 33,
      "blue": 34,
      "magenta": 35,
      "cyan": 36,
      "white": 37,
    ];
  }
}
mixin(ConsoleCalls!("OutputConsole"));
