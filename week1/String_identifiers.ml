(*Suppose that a variable word exists and is a string.

Define a variable sentence that uses 5 string concatenations to create a string containing 9 times word, separated by commas (',').

This time, experiment with defining local let ... ins to store the partial results.*)

let sentence =
  let one = word ^ "," in
  let two = one ^ one in
  let four = two ^ two in
  let eight = four ^ four in
  eight ^ word;;
