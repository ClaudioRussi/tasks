FactoryGirl.define do
  factory :project, aliases:['authored_project', 'collaborating_project'] do
    first_name {'Pedro'}
    last_name {'Fernandez'}
    password {'topsecret'}
    password_confirmation {'topsecret'}
    email {'example@mail.com'}
    group
    collaborator
    author
  end
end
