const readline = require("readline");

class Clock {
    constructor() {
        // 1. Create a Date object.
        const time = new Date();
        // 2. Store the hours, minutes, and seconds.
        this.hours = time.getHours();
        this.minutes = time.getMinutes();
        this.seconds = time.getSeconds();
        // 3. Call printTime.
        this.printTime();
        // 4. Schedule the tick at 1 second intervals.
        setInterval(this._tick.bind(this), 1000)
        
    }

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.
        const printedTime = [this.hours, this.minutes, this.seconds].join(':');
        console.log(printedTime);
    }

    _tick() {
        // 1. Increment the time by one second.
        this._tickSeconds();
        // 2. Call printTime.
        console.clear();
        this.printTime();
    }

    _tickSeconds() {
        this.seconds++;
        if (this.seconds === 60) {
            this.seconds = 0;
            this._tickMinutes();
        } 
    }

    _tickMinutes() {
      this.minutes++;
      if (this.minutes === 60) {
        this.minutes = 0;
        this._tickHours();
      } 
    }

    _tickHours() {
      this.hours++;
      if (this.hours === 24) {
        this.hours = 0
      }
    }
}

const clock = new Clock();

//ADD NUMBERS///////////////////////////////////////////////////////

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// function addNumbers(sum, numsLeft, completionCallback) {
//     if (numsLeft>0) {
//         reader.question('Give Me a Number', function (input) {
//             const num = parseInt(input);
//             sum += num;
//             console.log('sum:'+sum);
//             addNumbers(sum, numsLeft-1, completionCallback);
//         });
//     } else {
//         completionCallback(sum);
//         reader.close();
//     }
// }


// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

// puts "the first argument"
// input = gets
// callback(input)



// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question(
    `Is ${el1} greater than ${el2}?: `,
    function (input) {
      if (input === 'yes') {
        callback(true);
      } else {
        callback(false);
      }
    }
  );
//   reader.close();
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  if (i == arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps);
    // return;
  }
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
  else {
    askIfGreaterThan(arr[i], arr[i+1], function (isGreater) {
      if (isGreater) {
        const temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;

        madeAnySwaps = true;
      }

      innerBubbleSortLoop(
        arr, i+1, madeAnySwaps, outerBubbleSortLoop
      );
    });
  }

}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
        innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
    } else {
        sortCompletionCallback(arr) //check for bug
    }
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}

// absurdBubbleSort([3, 2, 1, 4, 7, 50, 19], function (arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });