FactoryGirl.define do
  factory :event do
    sequence(:title)   { |n| Faker::Hacker.ingverb.titleize + "#{n}" }
    subtitle          { Faker::Hacker.ingverb.titleize }
    location          { Faker::Address.street_address }
    occurrences       { '05/09/2015-06/04/2015' }
    start_date        { '05/09/2015' }
    end_date          { '06/04/2015' }
    teaser            { Faker::Company.bs }
    summary           { Faker::Lorem.paragraph }
    audience          { 'All the peoples of the wide world!' }
    categories        { 'Gardening and Lawn Gnome placement.' }
    image             { 'https://hooperdooperton.express.org/flimflam' }
    published         { true }
    contact_name      { Faker::Name.name }
    contact_email     { Faker::Internet.email }
    contact_phone     { Faker::PhoneNumber.cell_phone }
    sponsor           { 'Cuka-Cola'}
    sponsor_site      { Faker::Internet.url }
    admission_info    { 'I did it, I\'m sorry!' }
    registration_info { 'Required. Now.' }
    map_url           { Faker::Internet.url }
  end
end
