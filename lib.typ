#let homework(doc, course, assignment_number, name, id) = {
  show title: set text(weight: "medium")
  let today = datetime.today()

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

#set text(font: "New Computer Modern", size: 12pt)
#show math.equation: set text(font: "New Computer Modern Math")

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#set page(numbering: "1")

#show table: set block(breakable: false)

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
