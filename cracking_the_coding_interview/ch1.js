// question 1
// Implement an algorithm to determine if a string has all unique
// characters. What if you can not use additional data structures?

function uniqueChars(str) {
  let letters = {};

  for(let i = 0; i < str.length; i++){
    if (letters[str[i]]) {
      return false;
    } else {
      letters[str[i]] = true;
    }
  }

  return true;
}

console.log('---------Unique Chars?----------');
console.log(uniqueChars("thiswordeck"));
console.log(uniqueChars("thiswordrecwks"));

// 3
// Design an algorithm and write code to remove the duplicate characters
// in a string without using any additional buffer NOTE: One or two
// additional variables are fine. An extra copy of the array is not
// FOLLOW UP
// Write the test cases for this method

function keepUniq(str) {
  let output = "";

  for(let i = 0; i < str.length; i++) {
    if(!output.includes(str[i])) {
      output += str[i];
    }
  }
  return output;
}

console.log('---------Delete Unique Chars----------');
console.log(keepUniq('aabbccdddddidddddde'));
console.log(keepUniq('abcdef'));

// 4
// Write a method to decide if two strings are anagrams or not

function anagrams(str1, str2) {
  let sort1 = str1.split("").sort();
  let sort2 = str2.split("").sort();
  if (sort1 === sort2) {
    return true;
  } else {
    return false;
  }
}

console.log('---------anagrams?----------');
console.log(anagrams('abcdef', 'aabbccdddddidddddde'));
console.log(anagrams('afedcb', 'abcdef'));

// 5
// Write a method to replace all spaces in a string with ‘%20’

function percent20(str) {
  let letters = str.split("");
  var output = [];

  for (let i = 0; i < letters.length; i++) {
    if (letters[i] === ' ') {
      output.push('%20');
    } else {
      output.push(letters[i]);
    }
  }
  return output.join('');
}

console.log('---------string replacer----------');
console.log(percent20('this is what life is about'));
console.log(percent20('b'));

// 6
// Given an image represented by an NxN matrix, where each pixel in the
// image is 4 bytes, write a method to rotate the image by 90 degrees.
// Can you do this in place?

function imageRotator(matrix) {
  // if (matrix.length <= 1) {
  //   return matrix;
  // }
  //
  // for (let i = 0; i < (matrix.length / 2); i++) {
  //   for (let j = i; j < matrix.length / 2 - i; j++) {
  //     matrix[i][j], matrix[i][-1 - j], matrix[-1 - i][-1 - j], matrix[-1-j][i]
  //       = matrix[-1-j][i], matrix[i][j], matrix[i][-1 - j], matrix[-1 - i][-1 - j];
  //   }
  // }
  // return matrix;
}

console.log('---------Image Rotator----------');
console.log(imageRotator([[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]]));
console.log(imageRotator(['a','b','c'],['d','e','f'],['g','h','i']));

// 7
// Write an algorithm such that if an element in an MxN matrix is 0, its
// entire row and column is set to 0

function zeroer(matrix) {
  
  let zeroes = [];
}

// 8
// Assume you have a method isSubstring which checks if one word is a
// substring of another Given two strings, s1 and s2, write code to
// check if s2 is a rotation of s1 using only one call to isSubstring
// (i e , “waterbottle” is a rotation of “erbottlewat”)

function isRotation(s1, s2) {

}

function isSubString(sub, str) {

}
