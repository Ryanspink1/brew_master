Fabricator(:brewery) do
  fb_id       {Faker::Number.number(10)}
  name        {Faker::Name.unique.name}
  phone       {Faker::PhoneNumber.unique.cell_phone}
  email       {Faker::Internet.unique.email}
  address     {Faker::Address.unique.street_address}
  city        {Faker::Address.city_prefix + Faker::Address.city_suffix}
  state       {Faker::Address.state}
  about       {Faker::Lorem.sentence}
  photo       {Faker::Internet.url}
  description {Faker::Lorem.paragraph}
  founded     {Faker::Date.between_except(10.years.ago, 1.years.ago, Date.today)}
  url         {Faker::Internet.url}
  zip_code    {Faker::Address.zip_code}
end
