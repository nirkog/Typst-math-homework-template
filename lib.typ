#let homework(doc, course, assignment_number, name, id) = {
  set text(font: "New Computer Modern", size: 12pt)
  show math.equation: set text(font: "New Computer Modern Math")

  show math.equation.where(block: true): eq => {
   block(width: 100%, inset: 0pt, align(center, eq))
  }

  set page(numbering: "1")

  show table: set block(breakable: false)

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

#let x = sym.crossmark
#let v = sym.checkmark

#let parts = enum.with(numbering: "a)")

#let exercise_counter = state("exercise_counter", 0)
#let exercise_status = state("exercise_status", array(()))

#let exercise(..args, done: false, todo: "") = {
  //line(length: 100%, stroke: 1pt + gray)

  [= Exercise #context (exercise_counter.get() + 1)] 

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

  exercise_status.update(old => {
    old.push(array((done, todo)))
    return old
  })
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

#let todo_status() = {
  [= Done Status]

  context {
    let i = 0
    while i < exercise_counter.final() {
      let done = exercise_status.final().at(i).at(0)
      let todo = exercise_status.final().at(i).at(1)
      if done {
        [+ #v]
      } else {
        if todo.len() == 0 {
          [+ #x]
        } else {
          [+ #x - *#todo*]
        }
      }
      i += 1
    }
  }
}
