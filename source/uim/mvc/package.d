module uim.mvc;

// Phobos
public import std.algorithm; 
public import std.range; 
public import std.range.primitives; 
public import std.range.interfaces; 
public import std.base64;
public import std.csv;
// public import std.json;
public import std.zip; // Read/write data in the ZIP archive format.
public import std.zlib;
public import std.stdio;
public import std.string;
public import std.uuid;
public import std.digest; // Compute digests such as md5, sha1 and crc32.
public import std.digest.crc; // Cyclic Redundancy Check (32-bit) implementation.
public import std.digest.hmac; // Compute HMAC digests of arbitrary data.
public import std.digest.md; // Compute MD5 hash of arbitrary data.
public import std.digest.murmurhash; // Compute MurmurHash of arbitrary data.
public import std.digest.ripemd; // Compute RIPEMD-160 hash of arbitrary data.
public import std.digest.sha; // Compute SHA1 and SHA2 hashes of arbitrary data.
public import std.file; // Manipulate files and directories.
public import std.path; // Manipulate strings that represent filesystem paths.
public import std.stdio; // Perform buffered I/O.
// Networking
public import std.socket; // Socket primitives.
public import std.typecons;
public import std.net.curl; // Networking client functionality as provided by libcurl.
public import std.net.isemail; // Validates an email address according to RFCs 5321, 5322 and others.
public import std.uri; // Encode and decode Uniform Resource Identifiers (URIs).
public import std.uuid; // Universally-unique identifiers for resources in distributed systems.
// Numeric
public import std.bigint; // An arbitrary-precision integer type.
public import std.complex; // A complex number type.
public import std.math; // Elementary mathematical functions (powers, roots, trigonometry).
public import std.mathspecial; // Families of transcendental functions.
public import std.numeric; // Floating point numerics functions.
public import std.random; // Pseudo-random number generators.
// String manipulation
public import std.string; // Algorithms that work specifically with strings.
public import std.array; // Manipulate builtin arrays.
public import std.algorithm; // Generic algorithms for processing sequences.
public import std.uni; // Fundamental Unicode algorithms and data structures.
public import std.utf; // Encode and decode UTF-8, UTF-16 and UTF-32 strings.
public import std.format; // Format data into strings.
public import std.path; // Manipulate strings that represent filesystem paths.
public import std.regex; // Regular expressions.
public import std.ascii; // Routines specific to the ASCII subset of Unicode.
public import std.encoding; // Handle and transcode between various text encodings.
public import std.windows.charset; // Windows specific character set support.
public import std.outbuffer; // Serialize data to ubyte arrays.

// Dub
public import vibe.d;

// UIM
public import uim.core;
public import uim.bootstrap;
public import uim.javascript;
public import uim.html;
public import uim.oop;
public import uim.controls;

public import uim.mvc.base;

public import uim.mvc.applications;
public import uim.mvc.authentications;
public import uim.mvc.caches;
public import uim.mvc.collections;
public import uim.mvc.commands;
public import uim.mvc.consoles;
public import uim.mvc.containers;
public import uim.mvc.controllers;
public import uim.mvc.helpers;
public import uim.mvc.javascripts;
public import uim.mvc.layouts;
public import uim.mvc.mixins;
public import uim.mvc.models;
public import uim.mvc.requests;
public import uim.mvc.routers;
public import uim.mvc.routes;
public import uim.mvc.security;
public import uim.mvc.sessions;
public import uim.mvc.tests;
public import uim.mvc.views;

// helpers
public import uim.mvc.mixins;
public import uim.mvc.tests;

@safe:
DMVCSession[string] appSessions;
DEntity[size_t] entityPool;
DEntity[][size_t] entitiesPool;

DMVCApplication thisServer;

size_t appErrorPrefix = 100000; 
string[size_t] appErrorCodes; 

Json toEntitySelect(string[string] data) {
  string eid = data.get("entity_id", data.get("id", ""));
  if (eid.empty) return Json(null);

  Json result = Json.emptyObject;
  result["id"] = eid;
  if ("versionNumber" in data) result["versionNumber"] = to!size_t(data["versionNumber"]);
  return result;
}

auto urlToSelect(string[string] data) {
    writeln("DATA -> ", data);
    Json result = Json.emptyObject;

    string eid = data.get("entity_id", data.get("id", ""));
    string ename = data.get("entity_name", data.get("name", ""));
    string enumber = data.get("entity_number", data.get("number", ""));

/*     if ((eid.length > 0) && (ename.length >0)) {
      auto id = Json.emptyObject; id["id"] = eid;
      auto name = Json.emptyObject; name["name"] = ename;
      result["$or"] = [id, name];
    } 
    else {
      if (eid.length > 0) result["id"] = eid;
      else if (ename.length > 0) result["name"] = ename;
    }    
 */    
    result["id"] = eid;
    if (enumber.length > 0) result["versionNumber"] = to!size_t(enumber);

    return result;
}

auto entityToData(DEntity entity) {
    return [
        "id": entity.id.toString,
/*         "name": entity.name,
 */        "versionNumber": to!string(entity.versionNumber)];
}


string entityToUrl(DEntity entity) {
    return "id=%s&name=%s&number=%s".format(entity.id, entity.name, entity.versionNumber);
}

string identityToUrl(string[string] data) {
    string[] result; 
    if ("id" in data) result ~= "id=%s".format(data["id"]);
/*     if ("name" in data) result ~= "name=%s".format(data["name"]);
 */    if ("number" in data) result ~= "number=%s".format(data["versionNumber"]);
    return result.join("&");
}

auto readTranslations(string file) {
  string[string] results;

  if (file.exists) {
    logInfo("INFO: Found translation file '"~file~"'");
    auto sw = std.datetime.stopwatch.StopWatch(std.datetime.stopwatch.AutoStart.yes);
    try {
      auto text = readText(file);
      foreach(line; text.lineSplitter.array) {
        auto pos = line.indexOf("=");
        if (pos > 0) {
          results[line[0..pos]] = line[pos+1..$];
        }
      }
      sw.stop();
      logInfo("INFO: Finished reading translation file after "~to!string(sw.peek.total!"usecs")~" usecs -> Read "~to!string(results.length)~" entries");
    }
    catch(Exception e) {
      logError("ERROR: "~e.msg);
    }
  }
  else {
    logWarn("WARNING: Translation file '"~file~"' not found.");
  }

  return results;
}

struct Config {
  // Defaults
  auto configFile = "config.json";
  auto name = "name";  
  auto mode = "debug";  
  auto httpMode = "OnlyHttp";
  // http
  ushort httpPort = 8080;
  auto httpAddresses = ["::1", "127.0.0.1"];
  auto httpLogFormat = "%h - %u %t \"%r\" %s %b \"%{Referer}i\" \"%{User-Agent}i\"";
  // https
  ushort httpsPort = 8181;
  auto httpsAddresses = ["::1", "127.0.0.1"];
  auto httpsLogFormat = "%h - %u %t \"%r\" %s %b \"%{Referer}i\" \"%{User-Agent}i\"";
  auto tlsChain = "";
  auto tlsPrivate = "";

  void readConfig(string file) {
    Json appConfig = Json.emptyObject;

    if (file.exists) {
      logInfo("INFO: Found translation file '"~file~"'");
      try {
        auto sw = std.datetime.stopwatch.StopWatch(std.datetime.stopwatch.AutoStart.yes);
        appConfig = parseJsonString(readText(file)); 

        foreach(kv; appConfig.byKeyValue) {
          switch(kv.key) {
            // Config general
            case "name": name = kv.value.get!string; break;
            case "mode": mode = kv.value.get!string; break;
            case "http_mode": httpMode = kv.value.get!string; break;
            // Config http
            case "http_port": httpPort = kv.value.get!ushort; break;
            case "http_addresses": httpAddresses = null;
              foreach(v; kv.value.get!(Json[])) httpAddresses ~= v.get!string; 
              break;
            case "http_logformat": httpLogFormat = kv.value.get!string; break;
            // Config https
            case "https_port": httpsPort = kv.value.get!ushort; break;
            case "https_addresses": httpsAddresses = null;
              foreach(v; kv.value.get!(Json[])) httpsAddresses ~= v.get!string; 
              break;
            case "https_logformat": httpsLogFormat = kv.value.get!string; break;
            case "tls_chain": tlsChain = kv.value.get!string; break;
            case "tls_private": tlsPrivate = kv.value.get!string; break;
            default: break;
          }
        }
        sw.stop();
        logInfo("INFO: Finished reading config file after "~to!string(sw.peek.total!"usecs")~ " usecs" );
      }
      catch(Exception e) {
        logError("ERROR: "~e.msg);
      }
    }
    else {
      logWarn("WARNING: Config file not found.");
    }
  }
} 

auto readOrCreateSession(HTTPServerRequest req, HTTPServerResponse res) {
  req.session = req.session ? req.session : res.startSession();
  return req.session;
}

// internal switch
void pageRedirect(HTTPServerResponse response, string[string] parameters, string path, bool useResponse = false) {
  if (useResponse) response.redirect(path);
  else parameters["redirect"] = path;
}

// Helper function to add Scriptcode in parameters["script"]
string[string] addToPageScript(string[string] parameters, string script) {
  parameters["script"] = parameters.get("script", "")~script;
  return parameters;
}

auto getValue(string[string] parameters, string[] keys, string defaultValue = "") {
  foreach(key; keys) if (key in parameters) return parameters[key];
  return defaultValue;
}

auto hasAnyKey(Json parameters, string[] keys...) {
  return hasAnyKey(parameters, keys);
}
auto hasAnyKey(Json parameters, string[] keys) {
  if (parameters ==  Json(null)) return false;
  foreach(key; keys) if (key in parameters) return true;
  return false;
}

auto hasAllKey(Json parameters, string[] keys...) {
  return hasAllKey(parameters, keys);
}
auto hasAllKey(Json parameters, string[] keys) {
  if (parameters == Json(null)) return false;
  foreach(key; keys) if (key !in parameters) return false;
  return true;
}

/* DAPPViewRegistry uimViewRegistry;
static this() {
  uimViewRegistry = ViewRegistry;
} */

auto editorSummary = `const editorSummary = KothingEditor.create("entity_summary", {
  display: "block",
  width: "100%",
  height: "auto",
  popupDisplay: "full",
  katex: katex,
  toolbarItem: [
    ["undo", "redo"],
    ["font", "fontSize", "formatBlock"],
    ["bold", "underline", "italic", "strike", "subscript", "superscript", "fontColor", "hiliteColor"],
    ["outdent", "indent", "align", "list", "horizontalRule"],
    ["link", "table", "image", "audio", "video"],
    ["lineHeight", "paragraphStyle", "textStyle"],
    ["showBlocks", "codeView"],
    ["math"],
    ["preview", "print", "fullScreen"],
    ["save", "template"],
    ["removeFormat"],
  ],
  templates: [
    {
      name: "Template-1",
      html: "<p>HTML source1</p>",
    },
    {
      name: "Template-2",
      html: "<p>HTML source2</p>",
    },
  ],
  charCounter: true,
});`;

auto editorText = `const editorText = KothingEditor.create("entity_text", {
  display: "block",
  width: "100%",
  height: "auto",
  popupDisplay: "full",
  katex: katex,
  toolbarItem: [
    ["undo", "redo"],
    ["font", "fontSize", "formatBlock"],
    ["bold", "underline", "italic", "strike", "subscript", "superscript", "fontColor", "hiliteColor"],
    ["outdent", "indent", "align", "list", "horizontalRule"],
    ["link", "table", "image", "audio", "video"],
    ["lineHeight", "paragraphStyle", "textStyle"],
    ["showBlocks", "codeView"],
    ["math"],
    ["preview", "print", "fullScreen"],
    ["save", "template"],
    ["removeFormat"],
  ],
  templates: [
    {
      name: "Template-1",
      html: "<p>HTML source1</p>",
    },
    {
      name: "Template-2",
      html: "<p>HTML source2</p>",
    },
  ],
  charCounter: true,
});`;

enum ViewModes { HTML, JS, XML }



