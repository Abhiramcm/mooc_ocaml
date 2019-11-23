(*Write a function is_sorted : string array -> bool which checks if the values of the input array are sorted in strictly increasing order, implying that its elements are unique (use String.compare).
Using the binary search algorithm, an element can be found very quickly in a sorted array. 
Write a function find : string array -> string -> int such that find arr word is the index of the word in the sorted array arr if it occurs in arr or -1 if word does not occur in arr. 
The number or array accesses will be counted, to check that you obtain the expected algorithmic complexity. Beware that you really perform the minimal number of accesses. For instance, if your function has to test the contents of a cell twice, be sure to put the result of the access in a variable, and then perform the tests on that variable.*)

let is_sorted a =
  let rec aux i =
    if i >= (Array.length a) - 1 then
      true
    else
    if String.compare a.(i) a.(i + 1) < 0 then
      aux (i + 1)
    else
      false
  in aux 0;;

let find dict word =
  let rec aux left right =
    let m = (left + right) / 2 in
    if m == left || m == right then
      -1
    else
      let result = String.compare word dict.(m) in
      match result with
      | -1 -> aux left m
      | 0 -> m
      | 1 -> aux m right
  in aux (-1) (Array.length dict);;
