const DOMNodeCollection = require("./dom_node_collection");

function $l(selector) {
    let arr = [];
    if (selector instanceof HTMLElement) {
        arr.push(selector);
    } else if (typeof selector === 'string') {
        arr = Array.prototype.slice.call(document.querySelectorAll(selector));
    }
    let DOMNC = new DOMNodeCollection(arr);
    return DOMNC;
};

window.$l = $l;