FactoryGirl.define do
  factory :user, aliases:[:author] do
    first_name {'Pedro'}
    last_name {'Fernandez'}
    password {'topsecret'}
    password_confirmation {'topsecret'}
    email {'example@mail.com'}
  end

  factory :user2, aliases:[:connection], class: :user do
    first_name {'Pablo'}
    last_name {'Picapiedra'}
    password {'topsecret'}
    password_confirmation {'topsecret'}
    email {'example@hotmail.com'}
  end
end
