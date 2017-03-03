const DOMNodeCollection = require("./dom_node_collection.js");

window.$l = function(selector) {
  let items = undefined;
  if (selector instanceof HTMLElement) {
    items = new DOMNodeCollection( selector );
  } else if (typeof selector === "string") {
    let nodelist = document.querySelectorAll(selector);
    items = new DOMNodeCollection( Array.from(nodelist) );
  }
  return items;
};

window.$l.empty = () => {};
window.$l.remove = () => {};
window.$l.attr = () => {};
window.$l.addClass = () => {};
window.$l.removeClass = () => {};
window.$l.html = () => {};
window.$l.find = () => {};
window.$l.children = () => {};
window.$l.parent = () => {};
