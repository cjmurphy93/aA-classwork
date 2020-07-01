Array.prototype.myEach = function (callback) {

    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }

}

doubler = function (num) {
    return num * 2;
}

let doubled = [1, 2, 3, 4].myEach(doubler);
console.log(doubled);

Array.prototype.myMap = function (callback) {
    let original = this;
    for (let i = 0; i < this.length; i++) {
        this[i] = callback(original[i]);
    }

    return this;
}

let test = [2, 2, 3, 16];
test.myMap(doubler);
console.log(test);

//[1,2,3] > [1,3,6]

Array.prototype.myReduce = function (callback, initialValue) {
    let arr = this;
    let acc = 0;
    if (initialValue === undefined) {
        acc = this[0];
        arr.shift();
    } else {
        acc = initialValue;

    }


    // arr.myEach(el => acc=callback(acc, el)); 
    arr.myEach(function accumulate(el) {
        acc = callback(acc, el);
    })
    return acc;
}

let a = [1, 2, 3].myReduce(function (acc, el) {
    return acc + el;
}, 25);
console.log(a);

let b = [1, 2, 3].myReduce(function (acc, el) {
    return acc + el;
});

console.log(b); 