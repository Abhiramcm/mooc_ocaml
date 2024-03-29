(* The idea of this exercise is to write functions that iterate on lists, using the fold_left and fold_right functions from the List module.

Write a function filter : ('a -> bool) -> 'a list -> 'a list that takes a predicate p (a function returning a boolean) and a list l and returns all the elements of l that satisfy p (for which p returns true).
Define, using List.fold_right, a function partition : ('a -> bool) -> 'a list -> 'a list * 'a list that takes a predicate p and a list l, and that partitions l by p. It returns a pair of two lists (lpos,lneg), where lpos is the list of all elements of l that satisfy p, and lneg is the list of all elements that do not satisfy p.
One way of sorting a list is as follows:
The empty list is already sorted.
If the list l has a head h and a rest r, then a sorted version of l can be obtained in three parts:
first a sorted version of all elements of r that are smaller or equal to h,
then h,
then a sorted version of all elements of r that are greater than h.
Write a function sort:'a list-> 'a list that implements this algorithm, using the function partition of the previous question. This sorting algorithm is also known as Quicksort where the pivot is always the first element of the list. *)

let filter p l = List.fold_right
    (fun x xs ->
       if p x then x::xs else xs) l [];;

let map f l =
  List.fold_right (fun x xs -> (f x)::xs) l []

let partition p l =
  let f = fun x (xs_pos, xs_neg) ->
    if p x
    then (x::xs_pos, xs_neg)
    else (xs_pos, x::xs_neg) in
  List.fold_right f l ([], [])

let rec sort = function
  | [] | [_] as l -> l
  | h::r ->
      let (lessers, greaters) = (partition (fun x -> x < h) r) in
      (sort lessers) @ (h :: (sort greaters))