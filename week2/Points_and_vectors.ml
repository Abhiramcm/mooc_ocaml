(*The given prelude defines three types, one for three dimensional points, another for velocity vectors in three dimensions, and another one representing moving objects in space. Velocity vectors are distance per discretized time unit dt.

Write a function move : point -> dpoint -> point such that move p dp is the point p whose coordinates have been updated according to dp. 
(x is now x +. dx, y is now y +. dy, z is now z +. dz.
Write a function next : physical_object -> physical_object such that next o is the physical object o at the next instant (defined as time t + dt). 
The position of next o is the position of o moved according to its velocity vector.
Suppose that these objects are spheres whose radius is 1.0. 
Write a function will_collide_soon : physical_object -> physical_object -> bool that tells if at the next instant, the two spheres will intersect.
*)

type point  = { x : float; y : float; z : float }
type dpoint = { dx : float; dy : float; dz : float }
type physical_object = { position : point; velocity : dpoint }

let move p dp =
  {x=(p.x +. dp.dx);y=(p.y +. dp.dy);z=(p.z +. dp.dz)};;

let next obj =
  let old_obj=obj.position in 
  let dp=obj.velocity in 
  let new_position=move old_obj dp in
  {position=new_position;velocity=dp};;

let will_collide_soon obj1 obj2 =
  let new_obj1 = next obj1
  and new_obj2 = next obj2 in
  let distance p1 p2 =
    sqrt ((p2.x -. p1.x) ** 2. +. (p2.y -. p1.y) ** 2. +. (p2.z -. p1.z) ** 2.)
  in distance new_obj1.position new_obj2.position < 2.