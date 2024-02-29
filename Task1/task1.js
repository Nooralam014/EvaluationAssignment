const crypto = require('crypto');

function task1(input){
var count = 0;
var i = 0;
while (count == 0) {
  const hash = crypto.createHash('sha256').update(i+input).digest('hex');

  if (hash.substring(0, 3) === "000") {
    count++;
    return "Special prefix is " + i;
  } else {
    i++;
  }
}
}
console.log(task1("SYSTEMS-LIMITED-PAKISTAN"))