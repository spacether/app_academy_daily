/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.l = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };

/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};

/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};

/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(arrEls) {
    this.items = arrEls;
  }
  html (value) {
    if (this.valset(value)) {
      this.each(item => (item.innerHTML=value) );
    } else {
      return this.items.map( item => item.innerHTML);
    }
  }
  empty (value) {
    this.html("");
  }

  append(newthings) {
    if (typeof newthings === "string") {
      this.each( item => (item.innerHTML+= newthings) );
    } else if (newthings instanceof HTMLElement) {
      newthings = newthings.outerHTML;
      this.each( item => (item.innerHTML+= newthings) );
    } else if (newthings instanceof DOMNodeCollection) {
      newthings = newthings.allhtml();
      this.each( item => (item.innerHTML += newthings) );
    }
  }

  attr(prop, val) {
    if (this.valset(val)) {
      this.each( item => item.setAttribute(prop, val) );
    } else {
      return this.items[0].getAttribute(prop);
    }
  }

  addClass(classStr) {
    this.each( item => {
      let classes = (item.className === "") ? [] : item.className.split(" ");
      if (classes.indexOf(classStr) === -1) {
        classes.push(classStr);
        console.log(classes);
        item.className = classes.join(" ");
      }
    });
  }

  removeClass(classStr) {
    this.each( item => {
      let classes = item.className.split(" ");
      let ind = classes.indexOf(classStr);
      if (ind !== -1) {
        classes.splice(ind, 1);
        item.className = classes.join(" ");
      }
    });
  }

  children() {
    let res = [];
    this.each( item => {
      res = res.concat(Array.from(item.children));
    });
    return new DOMNodeCollection(res);
  }

  parent() {
    let parents = [];
    this.each( item => {
      if (!parents.includes(item.parentElement)) {
        parents.push(item.parentElement);
      }});
    return new DOMNodeCollection(parents);
  }

  find(selector) {
    let found = [];
    this.each( item => {
      found = found.concat(Array.from(item.querySelectorAll(selector)));
    });
    return new DOMNodeCollection( Array.from(found) );
  }

  remove() {
    this.each( item => item.remove() );
    this.items = [];
  }

  on (type, selector, callback) {
    // ignore selector
    let othercol = new DOMNodeCollection([]);
    if (selector !== "") othercol = this.find(selector);
    if (othercol.items.length === 0) {
      othercol.items = othercol.items.concat(this.items);
    }
    othercol.each( item => {
      item.addEventListener(type, callback);
    });
  }

  off (type, selector, callback) {
    // ignore selector
    let othercol = new DOMNodeCollection([]);
    if (selector !== "") othercol = this.find(selector);
    if (othercol.items.length === 0) {
      othercol.items = othercol.items.concat(this.items);
    }
    othercol.each( item => {
      item.removeEventListener(type, callback);
    });
  }

  each(callback) {
    this.items.forEach(callback);
  }
  valset(x) {
    return (x !== undefined);
  }
  allhtml() {
    return this.items.map(item => item.outerHTML).join("");
  }
}

module.exports = DOMNodeCollection;


/***/ })
/******/ ]);