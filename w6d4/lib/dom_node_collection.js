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
