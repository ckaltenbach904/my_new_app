FactoryBot.define do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }

    factory :user do
        email 
        password 
        first_name "Peter"
        last_name "Example"
        is_admin false
    end

    factory :admin, class: User do
        email 
        password
        is_admin true
        first_name "Admin"
        last_name "User"
    end
end