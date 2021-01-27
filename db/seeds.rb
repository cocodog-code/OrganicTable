# メインのサンプルユーザーを1人作成する
store = Store.new(name: "Example User",
             genre: "French",
             phone: "012-345-678",
             access: "中央駅東口徒歩5分",
             hour: "10:00 ~ 22:00",
             website: "example.com",
             address: "東京都中区1-2-3",
             description: "手軽な価格で本格的なフレンチ料理が味わえるレストランです")
             
             store.image.attach(io: File.open('app/assets/images/vegetable-3.jpg'), filename: 'vegetable-3.jpg', content_type: 'image/jpg')
            #  image: open("#{Rails.root}/app/assets/images/vegetable-3.jpg"))

store.save
# 追加のユーザーをまとめて生成する
20.times do |n|
  name  = Faker::Name.name
  genre = "genre #{n}"
  phone = "000-#{n}"
  access = "徒歩５分"
  hour = "10:00 ~ 22:00"
  website = "example-#{n}.com"
  address = "東京都#{n}番目"
  description = "#{n}番目のレストランです。さまざまな料理をお手軽な値段でいただけます"
  store = Store.new(
    name: name,
    genre: genre,
    phone: phone,
    access: access,
    hour: hour,
    website: website,
    address: address,
    description: description
  )
  store.image.attach(io: File.open('app/assets/images/vegetable-3.jpg'), filename: 'vegetable-3.jpg', content_type: 'image/jpg')
  store.save
end