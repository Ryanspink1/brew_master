Fabricator(:event) do
  fb_id       {Faker::Number.number(15)}
  name        {Faker::Name.unique.name}
  cover       {Faker::Internet.url}
  description {Faker::Lorem.paragraph}
  start_time  {Faker::Time.between(DateTime.now + 1, DateTime.now + 200)}
  end_time    {Faker::Time.between(DateTime.now + 1, DateTime.now + 200)}
  place       {Faker::Name.unique.name}
  address     {Faker::Address.unique.street_address}
  city        {Faker::Address.city_prefix + Faker::Address.city_suffix}
  state       {Faker::Address.state}
  brewery_id  {Faker::Number.number(10)}
end
