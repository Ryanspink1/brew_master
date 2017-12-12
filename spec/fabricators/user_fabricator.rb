Fabricator(:user) do
  email       {Faker::Internet.unique.email}
  first_name  {Faker::Name.unique.name}
  last_name   {Faker::Name.unique.name}
  zip_code    {Faker::Address.zip_code}
  role        {1}
  password    {"hello"}
end
