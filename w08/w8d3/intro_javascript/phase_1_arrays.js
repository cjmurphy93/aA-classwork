Array.prototype.uniq = function() {
    let result=[];
    // debugger
    for(let i=0; i <this.length; i++) {
        if (result.includes(this[i])) {
            continue;
        }
        else {
            result.push(this[i]);
        }
    }
    return result;
}

let unique_array = [1, 2, 2, 3, 3, 3].uniq();
// console.log(unique_array);


Array.prototype.twoSum = function() {
    let result = [];
    for(let i = 0; i < this.length; i++) {
        for(let j = 0; j < this.length; j++) {
            if ((this[i] + this[j] === 0) && (j > i)) {
                result.push([i,j]);
            }
        }
    }
    return result;
}

let test_array = [1, -2, 2, -3, 3, 5].twoSum();
console.log(test_array)

Array.prototype.transpose = function() {
    let result=[];
    for(let r=0; r<this[0].length; r++) {
        let row=[];
        for(let c=0; c<this.length; c++) {
            row.push(this[c][r]);
        }
        result.push(row);
    }
    return result;
}

let squareArr = [[2,2],[4,4],[6,6]].transpose();
console.log(squareArr);

