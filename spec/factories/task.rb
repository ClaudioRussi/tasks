FactoryGirl.define do
  factory :in_progress_task, class: :task do
    name {'Test'}
    description {'Test the application'}
    status {'In progress'}
    group
  end

  factory :pending_task, class: :task do
    name {'Create models'}
    description {"Create the application's model"}
    status {'Pending'}
    group
  end

  factory :finished_task, class: :task do
    name {'Create controllers'}
    description {"Create the application's controllers"}
    status {'Finished'}
    group
  end
end
