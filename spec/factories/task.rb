FactoryGirl.define do
  factory :task_in_progress, class: :task do
    name {'Test'}
    description {'Test the application'}
    status {'In Progress'}
    group
  end

  factory :pending_task, class: :task do
    name {'Create models'}
    description {"Create the application's model"}
    status {'Pending'}
    group
  end

  factory :completed_task, class: :task do
    name {'Create controllers'}
    description {"Create the application's controllers"}
    status {'Completed'}
    group
  end
end
