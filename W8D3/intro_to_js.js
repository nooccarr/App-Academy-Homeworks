// Mystery Scoping with var, let, const
// Test out each of following functions in Node. What does each log to the console? 
// Do any of them throw errors? See if you can figure out why.

function mysteryScoping1() {
    var x = 'out of block';     // var: function scope
    if (true) {                 // truthy value
        var x = 'in block';     // re-assign x = 'in block'
        console.log(x);         // puts x (function scope)
    }
    console.log(x);             // puts x (function scope)
}

// in block
// in block

function mysteryScoping2() {
    const x = 'out of block';   // const: local scope
    if (true) {                 // truthy value
        const x = 'in block';   // not same as 'const x' outside this scope
        console.log(x);         // puts x (inner scope)
    }
    console.log(x);             // puts x (outer scope)
}

// in block
// out of block

// function mysteryScoping3() {
//     const x = 'out of block';   // const: local(outer) scope
//     if (true) {
//         var x = 'in block';     // var: function scope: cannot reassign const (EXIT)
//         console.log(x);         
//     }
//     console.log(x);             
// }

// Uncaught SyntaxError: Identifier 'x' has already been declared

function mysteryScoping4() {
    let x = 'out of block';     // let: local(outer) scope
    if (true) {
        let x = 'in block';     // let: local(inner) scope
        console.log(x);
    }
    console.log(x);
}

// in block
// out of block

// function mysteryScoping5() {
//     let x = 'out of block';         // local(outer) scope
//     if (true) {
//         let x = 'in block';         // local(inner) scope
//         console.log(x);             
//     }
//     let x = 'out of block again';   // local(outer) scope: can reassign/modify, but cannot re-declare (EXIT)
//     console.log(x);
// }

// Uncaught SyntaxError: Identifier 'x' has already been declared

// madLib
// Write a function that takes three strings - a verb, an adjective, and a noun - 
// uppercases and interpolates them into the sentence "We shall VERB the ADJECTIVE NOUN".
// Use ES6 template literals.

function madLib(verb, adjective, noun) {
    console.log(`We shall ${ verb.toUpperCase() } the ${ adjective.toUpperCase() } ${ noun.toUpperCase() }`)
}

madLib('make', 'best', 'guac'); // "We shall MAKE the BEST GUAC."

// isSubstring
// Input:  1) A String, called searchString.
//         2) A String, called subString.
// Output: A Boolean. 
//         true if the subString is a part of the searchString.

function isSubstring(searchString, subString) {
    // solution 1:
    // return searchString.includes(subString);

    const subStrs = []
    for (let i = 0; i < searchString.length; i++) {
        for (let j = i + 1; j <= searchString.length; j++) {
            subStrs.push(searchString.slice(i, j));
        }
    }
    
    // solution 2:
    // return subStrs.includes(subString);      // return is mandatory

    // solution 3:
    // let isTrue = false;
    // subStrs.forEach(function(subStr) {
    //     if (subString === subStr) {
    //         isTrue = true;
    //     }
    // })

    // return isTrue;

    // solution 4:
    for (let i = 0; i < subStrs.length; i++) {
        if (subStrs[i] === subString) {
            return true;
        }
    };

    return false;
}

isSubstring("time to program", "time")  // true
isSubstring("Jump for joy", "joys")     // false

// fizzBuzz
// 3 and 5 are magic numbers.

// Define a function fizzBuzz(array) that takes an array and returns a new array of 
// every number in the array that is divisible by either 3 or 5, but not both.

function fizzBuzz(array) {
    const newArray = [];

    // solution 1:
    // for (let i = 0; i < array.length; i++) {
    //     if (array[i] % 3 === 0 && array[i] % 5 === 0) {
    //         continue;
    //     } else if (array[i] % 3 === 0) {
    //         newArray.push(array[i]);
    //     } else if (array[i] % 5 === 0) {
    //         newArray.push(array[i]);
    //     }
    // }

    // solution 2:
    array.forEach(ele=> {
        if ((ele % 3 === 0) ^ (ele % 5 === 0)) {
            newArray.push(ele)
        }
    })

    return newArray;
}

fizzBuzz([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]);

// isPrime
// Define a function isPrime(number) that returns true if number is prime.
// Otherwise, false. Assume number is a positive integer.

function isPrime(number) {
    if (number < 2) { return false; }

    for (let i = 2; i < number; i++) {
        if (number % i == 0) {
            return false;
        }
    }

    return true;
}

isPrime(2)              //true
isPrime(10)             //false
isPrime(15485863)       //true
isPrime(3548563)        //false

// sumOfNPrimes
// Using firstNPrimes, write a function sumOfNPrimes(n) that returns the 
// sum of the first n prime numbers. Hint: use isPrime as a helper method.

function sumOfNPrimes(n) {
    let sumNum = 0;
    let primeNums = 0; 
    let i = 2;

    while (primeNums < n) {
        if (isPrime(i)) {
            sumNum += i;
            primeNums++;
        }
        i++;
    }

    return sumNum;
}

sumOfNPrimes(0) // 0
sumOfNPrimes(1) // 2
sumOfNPrimes(4) // 17