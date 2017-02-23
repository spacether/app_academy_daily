function bubbleSort(arr) {
  let moved = true;
  while (moved) {
    moved = false;
    for(let i = 0; i < arr.length - 1; i++) {
      let val = arr[i];
      if (val > arr[i+1]) {
        moved = true;
        arr[i] = arr[i+1];
        arr[i+1] = val;
      }
    }
  }
  return (arr);
}

bubbleSort([5,2,3,9,4,6,5]);



function susbstrings(word) {
  let res = [];
  for(let i=0; i < word.length; i++) {
    for(let j = i+1; j < word.length + 1; j++) {
      let subword = word.slice(i,j);
      if (!res.includes(subword)) res.push(subword);
    }
  }
  return (res);
}

susbstrings("cat");
