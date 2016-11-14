FactoryGirl.define do
  factory :connection_request do
    status{'Unconfirmed'}
    connection
    user
  end

  factory :accepted_connection_request, class: :connection_request do
    status {'Accepted'}
    connection
    user
  end
end
