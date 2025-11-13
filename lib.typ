#let homework(doc, course, assignment_number, name, id) = {
  let today = datetime.today()
  set text(font: "New Computer Modern Math", size: 12pt)

  show title: set text(weight: "medium")
  show table: set block(breakable: false)

  place(
    top + center,
    float: true,
    block(
      {
        title(course + " - Assignment " + str(assignment_number))

        block(name + " - " + str(id))

        block(today.display("[month repr:long] [day], [year]"))
      }
    )
  )

  doc
}

#let parts = enum.with(numbering: "a)")

#let exercise_counter = state("exercise_counter", 1)

#let exercise(..args) = {
  //line(length: 100%, stroke: 1pt + gray)

  [= Exercise #context exercise_counter.get()] 

  let problem = ""
  let solution = ""
  if args.pos().len() == 1 {
    solution = args.at(0)
  } else {
    problem = args.at(0)
    solution = args.at(1)
  }

  if type(problem) == array {
    problem = parts(..problem) 
  }
  if type(solution) == array {
    solution = parts(..solution) 
  }

  if problem == "" {
    solution
  } else {
    [== Problem]
    problem

    [== Solution]
    solution
  }

  exercise_counter.update(old => old + 1)
}

#let iff(first_direction, second_direction) = {
  [$=>)$]
  first_direction

  [
    \
  ]

  [$arrow.double.l)$]
  second_direction
}

#let x = sym.crossmark
#let v = sym.checkmark
