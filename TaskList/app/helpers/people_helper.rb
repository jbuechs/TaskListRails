module PeopleHelper
  def num_incomplete(person_id)
    person = Person.find(person_id)
    tasks = person.tasks.where(completed_date: nil)
    return tasks.length
  end

  def total_tasks(person_id)
    person = Person.find(person_id)
    tasks = person.tasks
    return tasks.length
  end
end
