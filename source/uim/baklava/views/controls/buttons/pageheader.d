module uim.baklava.view.controls.buttons.pageheader;

@safe:
import uim.baklava;

auto buttonLinkRefresh(string link, string[] classes = null) {
  return UIMButton(["me-3"]~classes, ["style":"background-color:white;border-color:#35A6FF;color:#35A6FF;"]).link(link)( 
    tablerIcon("refresh", ["text-uim"])~" Neuladen");
}

auto buttonLinkList(string link, string[] classes = null) {
  return UIMButton(["text-white me-3"]~classes, ["style":"background-color:#35A6FF"]).link(link)(
    tablerIcon("list", ["text-white"])~"Übersicht");
}

auto buttonLinkCreate(string link, string[] classes = ["me-1"]) {
  return UIMButton(["text-white"]~classes, ["style":"background-color:#35A6FF"]).link(link)(
    tablerIcon("plus", ["text-white"])~"Erstellen");
}
auto buttonLinkView(string link, string[] classes = ["me-1"]) {
  return UIMButton(["text-white"]~classes, ["style":"background-color:#35A6FF"]).link(link)(
    tablerIcon("eye", ["text-white"])~"Anzeigen");
}

auto buttonLinkEdit(string link, string[] classes = ["me-1"]) {
  return UIMButton(["text-white"]~classes, ["style":"background-color:#35A6FF"]).link(link)( 
    tablerIcon("edit", ["text-white"])~"Bearbeiten");
}

auto buttonLinkVersion(string link, string[] classes = ["me-1"]) {
  return UIMButton(["text-white"]~classes, ["style":"background-color:#35A6FF"]).link(link)( 
    tablerIcon("copy", ["text-white"])~"Neue Version");
}

auto buttonLinkPrint(string link, string[] classes = ["me-1"]) {
  return UIMButton(["text-white"]~classes, ["style":"background-color:#35A6FF"]).link(link)(
    tablerIcon("printer", ["text-white"])~"Drucken");
}

auto buttonLinkExport(string link, string[] classes = ["me-1"]) {
  return UIMButton(["text-white"]~classes, ["style":"background-color:#35A6FF"]).link(link)( 
    tablerIcon("download", ["text-white"])~"Export");
}

auto buttonLinkImport(string link, string[] classes = ["me-1"]) {
  return UIMButton(["text-white"]~classes, ["style":"background-color:#35A6FF"]).link(link)( 
    tablerIcon("download", ["text-white"])~"Import");
}

auto buttonLinkDelete(string link, string[] classes = null) {
  return UIMButton(["text-white"]~classes, ["style":"background-color:#35A6FF"]).link(link)(   
    tablerIcon("trash", ["text-white"])~"Löschen");
}

auto buttonLinkLock(string link, string[] classes = null) {
  return UIMButton(["text-white"]~classes, ["style":"background-color:#35A6FF"]).link(link)(   
    tablerIcon("trash", ["text-white"])~"Lock");
}

auto buttonLinkUnlock(string link, string[] classes = null) {
  return UIMButton(["text-white"]~classes, ["style":"background-color:#35A6FF"]).link(link)(   
    tablerIcon("trash", ["text-white"])~"Unlock");
}

auto buttonForPageHeader(string name, string rootPath, string id = "") {
  switch(name) {
    case "refresh": return buttonLinkRefresh(rootPath~"/refresh"); 
    case "create": return buttonLinkCreate(rootPath~"/create"); 
    case "list": return buttonLinkList(rootPath);  
    case "read", "view": return buttonLinkView(rootPath~"/view?entityid="~id);
    case "edit", "update": return buttonLinkEdit(rootPath~"/edit?entityid="~id); 
    case "delete", "remove": return buttonLinkDelete(rootPath~"/delete?entityid="~id); 
    case "version":return buttonLinkVersion(rootPath~"/version?entityid="~id); 
    case "lock":return buttonLinkLock(rootPath~"/lock?entityid="~id);  
    case "unlock":return buttonLinkUnlock(rootPath~"/unlock?entityid="~id); 
    case "print":return buttonLinkPrint(rootPath~"/print?entityid="~id);
    case "export":return buttonLinkExport(rootPath~"/export?entityid="~id); 
    case "import":return buttonLinkImport(rootPath~"/import?entityid="~id); 
    default: return null;
  }
}

auto pageheaderToolbarButtons(string[][] names, string rootPath, string id = "") {
    DUIMButtonControl[] results;

    foreach(gIndex, group; names) {
      DUIMButtonControl[] buttons = group.map!(a => buttonForPageHeader(a, rootPath, id)).array;

      if (gIndex < names.length-1 && buttons.length > 0) { // not last group
        buttons[$-1].addClasses("me-3");
      }

      results ~= buttons;
    }
    
    return results;
  } 