function range(start, end) {
  let res = [start];
  if (start === end) return res;
  return res.concat(range(start+1, end));
}

range(1, 4);

function rangeIter(start, end) {
  let res = [];
  for(let i = start; i <= end; i++) {
    res.push(i);
  }
  return res;
}
rangeIter(1, 6);



const exp = (b, n) => {
  if (n === 0) return 1;
  return(b * exp(b,n-1));
};
exp(2,3);
exp(2,0);


let expon = (b, n) => {
  if (n === 0) return 1;
  if (n === 1) return b;
  if (n % 2 === 0) {
    let inner = expon(b, Math.floor(n / 2));
    return( Math.pow(inner, 2) );
  } else {
    let inner = (expon(b, Math.floor((n - 1) / 2)));
    return( b * Math.pow(inner, 2) );
  }
};
expon(2,3);


function fib(n) {
  if ( n === 1 ) return([1]);
  if ( n === 2 ) return([1, 1]);
  console.log(n-1);
  let fibSeq = fib(n -1);
  console.log(fibSeq);
  let val = fibSeq[fibSeq.length - 1] + fibSeq[fibSeq.length - 2];
  return ( fibSeq.concat(val) );
}
fib(1);
fib(4);
