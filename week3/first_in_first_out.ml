(* A queue is a standard FIFO data structure. See wikipedia

In this exercise, we implement a queue with a pair of two lists (front, back) such that front @ List.rev back represents the sequence of elements in the queue.

Write a function is_empty : queue -> bool such that is_empty q is true if and only if q has no element.
Write a function enqueue : int -> queue -> queue such that enqueue x q is the queue as q except that x is at the end of the queue.
Write a function split : int list -> int list * int list such that split l = (front, back) where l = back @ List.rev front and the length of back and front is List.length l / 2 or List.length l / 2 + 1
Write a function dequeue : queue -> int * queue such that dequeue q = (x, q') where x is the front element of the queue q and q' corresponds to remaining elements. This function assumes that q is non empty. *)

type queue = int list * int list

let is_empty (front, back) = 
  front==[] && back==[];;

let enqueue x (front, back) =
  (front,x::back);;

let split l =
  let rec aux back lst =
    match lst with
    | lst when List.length lst - List.length back <= 1 -> (List.rev lst, List.rev back)
    | hd :: tl -> aux (hd :: back) tl in
  aux [] l;;

let dequeue (front, back) =
  match front with
  | [] -> let (f_hd :: f_tl), b = split back in (f_hd, (f_tl, b))
  | hd :: tl -> (hd, (tl, back));;