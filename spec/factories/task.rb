FactoryGirl.define do
  factory :task  do
    name {'Test'}
    description {'Test the application'}
    status {'In Progress'}
    group
    collaborator
  end
end
