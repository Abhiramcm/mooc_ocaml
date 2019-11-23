(*Consider a non empty array of integers a.

Write a function min : int array -> int that returns the minimal element of a.
Write a function min_index : int array -> int that returns the index of the minimal element of a.
Do you think these functions work well on large arrays ?

Define a variable it_scales and set it to "yes" or "no".
*)

let min a =
  let rec aux i m =
    if i < Array.length a then
      if a.(i) < m then
        aux (i + 1) a.(i)
      else
        aux (i + 1) m
    else
      m
  in aux 0 a.(0) 
;;

let min_index a =
  let rec aux i mv mi =
    if i < Array.length a then
      if a.(i) < mv then
        aux (i + 1) a.(i) i
      else
        aux (i + 1) mv mi
    else
      mi
  in aux 0 a.(0) 0;;

let it_scales = "no" ;;
