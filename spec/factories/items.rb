FactoryBot.define do
  factory :item do
    id {1}
    name {"TESTくん"}
    text {"test用のテキストです"}
    price {"3000"}
    category_id {1}
    condition_id {1}
    burden_id {1}
    area_id {1}
    shipping_date_id {1}
    brand {"test"}

    after(:build) do |item|
      item.images << FactoryBot.build(:image, item: item)
    end  
  end

  factory :image do
    src {Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/sample.png"), 'image/png')}
  end
end