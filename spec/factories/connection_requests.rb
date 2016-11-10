FactoryGirl.define do
  factory :connection_request do
    status{'Unconfirmed'}
    connection
    user

  end
end
