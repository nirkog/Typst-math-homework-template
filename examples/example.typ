#import "@local/math-homework-template:0.1.0": *

#show: doc => homework(
  doc,
  "Linear Algebra",
  1,
  "Nir Kogman",
  212322184
)

// #todo_status()

#exercise(
([
Prove that $x$ is positive.
],
[
Show that $x + y$ is negative.
]),
[
Let $x$ be positive.
],
todo: "Finish 1"
)

#exercise(
[
Let $y$ be positive.
],
todo: "Do 1 and write down 3"
)

#exercise(
[
Show that $x > 5$ if and only if $x > 6$.
],
[
#iff(
  [
  If $x > 6$ then $x > 5$.
  ],
  [
  If $x > 5$ the $x > 6$. 
  ]
)
],
done: true
)
