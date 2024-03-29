(* We have seen in the course the example of non exhaustive pattern matching given below. Write the code for the missing cases. *)

type color = Black | Gray | White ;;

let lighter c1 c2 =
  match (c1, c2) with
  | (Black, Black) -> false
  | (White, White) -> false
  | (Gray, Gray) -> false
  | (Black, _) -> true
  | (_, White) -> true
  | (White, Gray) -> false
  | (Gray, Black) -> false
  | (White, Black) -> false
;;
