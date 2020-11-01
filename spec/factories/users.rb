FactoryBot.define do
  factory :user do
    nickname {"フリマ"}
    family_name {"山田"}
    family_name_furigana {"ヤマダ"}
    first_name {"華"}
    first_name_furigana {"ハナ"}
    email {"kkk@gmail.com"}
    password {"octorber01"}
    password_confirmation {"octorber01"}
  end
end