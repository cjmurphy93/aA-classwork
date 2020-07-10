class DOMNodeCollection {
    constructor(arr) {
        this.htmlEls = arr
    }
};


DOMNodeCollection.prototype.html = function(string) {
    if (typeof string === 'undefined') {
        string = this.htmlEls[0];
        return string.innerHTML;
    };
    this.htmlEls.forEach((el) => {
        el.innerHTML = string;
    });
};

DOMNodeCollection.prototype.empty = function() {
    this.html('');
};

DOMNodeCollection.prototype.append = function(arg) {
    

    if (arg instanceof DOMNodeCollection) {
        this.htmlEls.forEach((el => {
            arg.htmlEls.forEach((el2) => {
                el.innerHTML += el2.outerHTML;
            })
        })) 
    } else if (typeof arg === 'string') { 
        this.htmlEls.forEach((el => {
            el.innerHTML += arg;
        }))

    } else if (arg instanceof HTMLElement) {
        this.htmlEls.forEach((el => {
            el.innerHTML += arg.outerHTML;
        })) 
    };
}

module.exports = DOMNodeCollection;