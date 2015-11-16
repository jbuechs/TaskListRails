def random_time
  Time.at(rand * Time.now.to_i)
end

tasks = [
  { name: "The First Task", description: "", completed_date: random_time, person_id: 2 },
  { name: "Go to Brunch", description: "Eggs bennie yum yum", person_id: 1 },
  { name: "Go to Lunch", description: "Soup soup soup", completed_date: random_time, person_id: 3 },
  { name: "Go to Second Lunch", description: "", person_id: 2 },
  { name: "Play Video Games", description: "", completed_date: random_time, person_id: 4 },
  { name: "High Five Somebody You Don't Know", description: "Be nice to strangers", completed_date: random_time, person_id: 1 },
  { name: "Plant Flowers", description: "", completed_date: random_time, person_id: 2 },
  { name: "Call Mom", description: "Wish her a happy birthday", person_id: 2 },
  { name: "She worries, you know.", description: "", person_id: 1 },
  { name: "Nap.", description: "", completed_date: random_time, person_id: 3 }
]

tasks.each do |task|
  Task.create task
end

people = [
  { name: "Jennie", email: "jennie@buechner.com"},
  { name: "Holiday", email: "holiday@buechner.com"},
  { name: "Judy", email: "judy@buechner.com"},
  { name: "Bill", email: "bill@buechner.com"}
]

people.each { |person| Person.create person }
