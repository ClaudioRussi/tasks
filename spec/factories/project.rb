FactoryGirl.define do
  factory :project, aliases:['authored_project', 'collaborating_project'] do
    name {'First Application'}
    description {'This project is our first app'}
    author
  end
end
