module uim.mvc.mixins.console;

@safe:
import uim.mvc;

auto consoleThis(string name) {
  return 
    mvcObjectThis(name)~
  `
  `;
}

template ConsoleThis(string name) {
  const char[] ConsoleThis = consoleThis(name);
}

string consoleCalls(string shortName, string className = null) {
  auto clName = className.length > 0 ? className : "D"~shortName;
  return
    mvcObjectCalls(shortName, className)~
    `
    `;
}

template ConsoleCalls(string shortName, string className = null) {
  const char[] ConsoleCalls = consoleCalls(shortName, className);
}