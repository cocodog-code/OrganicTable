include ActionDispatch::TestProcess

FactoryBot.define do
  factory :store do
    sequence(:name) { |n| "organictable-#{n}" }
    genre { 'Japanese' }
    sequence(:phone) { |n| "0123-456-789-#{n}" }
    access { '銀座駅から徒歩5分' }
    hour { '10:00 ~ 22:00' }
    website { 'https://example.com' }
    address { '東京都中央区1-2-3' }
    image { fixture_file_upload(Rails.root.to_s + "/spec/fixtures/files/test_image.jpg") }
  end
end
