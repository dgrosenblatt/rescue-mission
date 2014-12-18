FactoryGirl.define do
  factory :user do
    provider "Facebook"
    uid "1234567890"
    name "Mark Zuckerberg"
    oauth_token "q3409ghqegb23iewrgi"
    oauth_expires_at "2014-12-17 08:50:32"
  end
end
