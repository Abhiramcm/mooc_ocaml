(* Every triangle has a circumscribed circle, that is a circle that goes through the three points of a given triangle. Trigonometry tells us that the radius of this circle is s2⋅cos(a2)⋅2⋅cos(b2)⋅2⋅cos(c2) where a, b and c are the angles of the triangle, and s is its circumference.

Define a function ccr: float -> float -> float -> float -> float that takes as arguments a, b, c and s, and returns the radius of circumscribed circle as described above.
Update ccr so that it does as much work as possible when partially applied to each argument, and minimizes the total number of operations (multiplications, divisions and calls to cos).
*)

let ccr =
  fun a -> let p_a = 8. *. cos (a /. 2.) in
    fun b -> let p_b = cos (b /. 2.) *. p_a in
      fun c -> let p_c = cos (c /. 2.) *. p_b in
        fun s -> s /. p_c;;