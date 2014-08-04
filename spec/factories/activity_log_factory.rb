FactoryGirl.define do
  factory :activity_log do
    action_performed  { ["update", "create", "destroy", "publish", "unpublish", "approve", "reject", "skip", "request_fact_check"].sample }
    acting_user       { Faker::Name.name }
    acting_user_email { Faker::Internet.email }
    reviewer_ids      { [Faker::Internet.password(10), Faker::Internet.password(10)] }
    message           { 'Your face has been updated' }
    snapshot          { {'added'=>['old nose', 'new nose']} }
    associated_id     { Faker::Internet.password(10) }
    associated_class  { 'Visage' }
    child             { 'Nase' }
  end
end
