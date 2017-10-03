# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Maker.create!(name: "マルハン"
#               )
# Maker.create!(name: "藤商事"
#               )
# Maker.create!(name: "サミー"
#               )    
              



 
             
             
# 500.times do |n|
#  number = Faker::Number.between(1, 10)
#  user_id = Faker::Number.between(1,30)
#  price = Faker::Number.number(6)

 
#  @maker = ["サミー", "京楽", "オリンピア", "藤商事", "タイヨーエレック", "ＥＸＣＩＴＥ"]
#  @sellname = ["ＣＲ戦国乙女４～花～３１９ｖｅｒ．【Ｈ１ＢＹ８】", "ＣＲルパン三世～Ｉ’ｍ　ａ　ｓｕｐｅｒ　ｈｅｒｏ～不二子におまかせ　１７８ｖｅｒ．【８Ｌ７ＢＺ】", "ＣＲ火曜サスペンス劇場２ＬＫＩ　真相の扉～２２の過ち～", "ＣＲ天元突破グレンラガン　ラゼンガンＶｅｒ．【ＬＮＡ】", "  デジハネＣＲスーパーロボット大戦ＯＧＱＴＡ【甘デジ】"]
#  @places = ["北海道", "近畿", "中国", "九州", "関東"]
#  @remnant = ["あり", "無し"]
#  @type_machine = ["本体", "セル"]
#  @condition = ["A", "B", "C"]
#  @stage = ["１次", "２次"]
#  @content_type = ["パチンコ", "スロット", "その他"]
#  @remarks = ["ボッロボロ", "綺麗", "担当は山田", "値段要相談", "送料別（１０００円）"]
#  @cylinder = ["あり", "無し"]
#  @removal_date = ["撤去済"]
 
#  removal_date = @removal_date.shuffle.sample
#  sellname = @sellname.shuffle.sample
#  maker = @maker.shuffle.sample
#  place = @places.shuffle.sample
#  remnant = @remnant.shuffle.sample
#  stage = @stage.shuffle.sample
#  condition = @condition.shuffle.sample
#  remarks = @remarks.shuffle.sample
#  type_machine = @type_machine.shuffle.sample
#  status = "受付"
#  content_type = @content_type.shuffle.sample
#  cylinder = @cylinder.shuffle.sample
#  #カスタムのseedはそもそもfakerプラグインは使わない。
 
 
#  Sell.create!(name: sellname,
#               content_type: content_type,
#               maker: maker,
#               number: number,
#               user_id: user_id,
#               place: place,
#               price: price,
#               removal_date: removal_date,
#               remnant: remnant,
#               stage: stage,
#               condition: condition,
#               remarks: remarks,
#               type_machine: type_machine,
#               status: status,
#               cylinder: cylinder
#               )
# end






# 34.times do |n|
#  name = "user-#{n+1}"
#  email = Faker::Internet.free_email
#  company_name = Faker::Company.name
#  company_name_sounds = "かいしゃ"
#  company_president = Faker::Name.name
#  company_president_sound = "しゃちょう"
#  company_post_number = Faker::Company.duns_number
#  @places = ["北海道", "神奈川県", "滋賀県", "大阪府", "京都府"]
#  company_place = @places.shuffle.sample
#  company_place_detail = "○○市○○区○○町○○番地○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○ビル"
#  company_call_number = Faker::Company.australian_business_number
#  company_fax_number = Faker::Company.australian_business_number
#  company_branch = "○○県○○市○○区○○町○○番地○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○ビル1201"
#  @company_type = ["販社", "店舗"]
#  company_type = @company_type.shuffle.sample
#  @company_union = ["北海道組合", "東北組合", "関東組合"]
#  company_union = @company_union.shuffle.sample
#  company_reception = Faker::Name.name
#  company_reception_sound = "なまえ"
#  @company_position = ["事務", "会計", "副社長"]
#  company_position = @company_position.shuffle.sample
#  company_post_number_contact = Faker::Address.postcode
#  @company_place_contact = ["北海道", "神奈川県", "滋賀県", "大阪府", "京都府"]
#  company_place_contact = @company_place_contact.shuffle.sample
#  company_call_number_contact = Faker::Company.australian_business_number
#  company_call_number_contact_name_1 =Faker::Name.name
#  company_call_number_contact_tel_1 =Faker::Company.australian_business_number
#  company_call_number_contact_name_2 =Faker::Name.name
#  company_call_number_contact_tel_2 =Faker::Company.australian_business_number
#  company_call_number_contact_name_3 =Faker::Name.name
#  company_call_number_contact_tel_3 =Faker::Company.australian_business_number
#  company_call_number_contact_name_4 =Faker::Name.name
#  company_call_number_contact_tel_4 =Faker::Company.australian_business_number
#  company_call_number_contact_name_5 =Faker::Name.name
#  company_call_number_contact_tel_5 =Faker::Company.australian_business_number
#  company_call_number_contact_name_6 =Faker::Name.name
#  company_call_number_contact_tel_6 =Faker::Company.australian_business_number
#  company_call_time_from_1 = Faker::Number.between(0, 23)
#  company_call_time_from_2 = Faker::Number.between(0, 59) 
#  company_call_time_to_1 = Faker::Number.between(0, 23)
#  company_call_time_to_2 = Faker::Number.between(0, 59) 
#  company_fax_number_contact =Faker::Company.australian_business_number
#  company_call_number_emergency =Faker::Company.australian_business_number
#  company_url = Faker::Internet.url
#  company_mail_address = "user-#{n+1}@example.com"
#  company_place_detail_contact = "○○市○○区○○町○○番地○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○ビル"
#  company_pr = Faker::Company.catch_phrase
 
#  @bank_name = ["みずほ銀行", "北洋銀行", "三菱UFJ銀行"]
#  bank_name = @bank_name.shuffle.sample
#  @bank_branch = ["札幌支店", "京都支店", "大阪支店"]
#  bank_branch = @bank_branch.shuffle.sample
#  @bank_username = ["ｶﾌﾞｼｷｶﾞｲﾎﾆｬﾗﾗｼｬ"]
#  bank_username = @bank_username.shuffle.sample
#  @bank_type = ["普通"]
#  bank_type = @bank_type.shuffle.sample
#  bank_number = Faker::Number.number(7)
 
 
              
#  User.create!(name: name,
#               email: email,
#               password: "password",
#               password_confirmation: "password",
#               activated: true,
#               activated_at: Time.zone.now,
# #               )
# # Detail.create!(
#               company_name: company_name,
#               company_name_sounds: company_name_sounds,
#               company_president: company_president,
#               company_president_sound: company_president_sound,
#               company_post_number: company_post_number,
#               company_place: company_place,
#               company_place_detail: company_place_detail,
#               company_call_number: company_call_number,
#               company_fax_number: company_fax_number,
#               company_branch: company_branch,
#               company_type: company_type,
#               company_union: company_union,
#               company_reception: company_reception,
#               company_reception_sound: company_reception_sound,
#               company_position: company_position,
#               company_post_number_contact: company_post_number_contact,
#               company_place_contact: company_place_contact,
#               company_call_number_contact: company_call_number_contact,
#               company_call_number_contact_name_1: company_call_number_contact_name_1,
#               company_call_number_contact_tel_1: company_call_number_contact_tel_1,
#               company_call_number_contact_name_2: company_call_number_contact_name_2,
#               company_call_number_contact_tel_2: company_call_number_contact_tel_2,
#               company_call_number_contact_name_3: company_call_number_contact_name_3,
#               company_call_number_contact_tel_3: company_call_number_contact_tel_3,
#               company_call_number_contact_name_4: company_call_number_contact_name_4,
#               company_call_number_contact_tel_4: company_call_number_contact_tel_4,
#               company_call_number_contact_name_5: company_call_number_contact_name_5,
#               company_call_number_contact_tel_5: company_call_number_contact_tel_5,
#               company_call_number_contact_name_6: company_call_number_contact_name_6,
#               company_call_number_contact_tel_6: company_call_number_contact_tel_6,
#               company_call_time_from_1: company_call_time_from_1,
#               company_call_time_from_2: company_call_time_from_2,
#               company_call_time_to_1: company_call_time_to_1,
#               company_call_time_to_2: company_call_time_to_2,
#               company_fax_number_contact: company_fax_number_contact,
#               company_call_number_emergency: company_call_number_emergency,
#               company_url: company_url,
#               company_mail_address: company_mail_address,
#               company_place_detail_contact: company_place_detail_contact,
#               company_pr: company_pr,
#               bank_name: bank_name,
#               bank_branch: bank_branch,
#               bank_username: bank_username,
#               bank_type: bank_type,
#               bank_number: bank_number
#               )
# end



    

 # default admin is false
 # 増やしたい時はtimesの数変えるだけ。
 # 減らしたい時は一旦 rake db:reset する必要
 
 
# users = User.order(:created_at).take(6)
# 50.times do
#  content = Faker::Lorem.sentence(5)
#  # Lorem - dummytext
#  # 5 は、最大5のlengthのtextという意味
 
#  users.each { |user| user.microposts.create!(content: content) }
# end



# # Following relationships
# users = User.all
# #fromユーザーテーブル

# user  = users.first
# following = users[2..50]
# #userのIDの２から５０
# followers = users[3..40]
# #userのIDの３から４０

# following.each { |followed| user.follow(followed) }
# #followingの単数系がfollowed
# followers.each { |follower| follower.follow(user) }
# #フォローイングに関するseeds





# 1000.times do |n|

#  @status = ["one", "two", "three", "return", "end", "return_end"]
#  @date_of_arrive = ["９月１８日", "９月１９日", "９月２０日"]
#  @limit_of_inspection = ["９月２５日", "９月２６日", "９月２７日"]

#  archive = false
#  archive_seller = false
#  status = @status.shuffle.sample
#  sell_id = Faker::Number.between(1,500)
#  seller_id = Faker::Number.between(1,35)
#  buyer_id = Faker::Number.between(1,35)
#  date_of_arrive = @date_of_arrive.shuffle.sample
#  confirm_price = Faker::Number.number(6)
#  confirm_number = Faker::Number.between(1,8)
#  limit_of_inspection = @limit_of_inspection.shuffle.sample

#  Safe.create!(archive: archive,
#               archive_seller: archive_seller,
#               status: status,
#               sell_id: sell_id,
#               seller_id: seller_id,
#               buyer_id: buyer_id,
#               date_of_arrive: date_of_arrive,
#               confirm_price: confirm_price,
#               confirm_number: confirm_number,
#               limit_of_inspection: limit_of_inspection,
#               )
# end



1.times do |n|
 
 # company_name = "中古パチスロ機器売買掲示板管理部"
 # company_name_sounds = "かいしゃ"
 # company_president = Faker::Name.name
 # company_president_sound = "しゃちょう"
 # company_post_number = Faker::Company.duns_number
 # @places = ["北海道", "神奈川県", "滋賀県", "大阪府", "京都府"]
 # company_place = @places.shuffle.sample
 # company_place_detail = "○○市○○区○○町○○番地○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○ビル"
 # company_call_number = Faker::Company.australian_business_number
 # company_fax_number = Faker::Company.australian_business_number
 # company_branch = "○○県○○市○○区○○町○○番地○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○ビル1201"
 # @company_type = ["販社", "店舗"]
 # company_type = @company_type.shuffle.sample
 # @company_union = ["北海道組合", "東北組合", "関東組合"]
 # company_union = @company_union.shuffle.sample
 # company_reception = Faker::Name.name
 # company_reception_sound = "なまえ"
 # @company_position = ["事務", "会計", "副社長"]
 # company_position = @company_position.shuffle.sample
 # company_post_number_contact = Faker::Address.postcode
 # @company_place_contact = ["北海道", "神奈川県", "滋賀県", "大阪府", "京都府"]
 # company_place_contact = @company_place_contact.shuffle.sample
 # company_call_number_contact = Faker::Company.australian_business_number
 # company_call_number_contact_name_1 =Faker::Name.name
 # company_call_number_contact_tel_1 =Faker::Company.australian_business_number
 # company_call_number_contact_name_2 =Faker::Name.name
 # company_call_number_contact_tel_2 =Faker::Company.australian_business_number
 # company_call_number_contact_name_3 =Faker::Name.name
 # company_call_number_contact_tel_3 =Faker::Company.australian_business_number
 # company_call_number_contact_name_4 =Faker::Name.name
 # company_call_number_contact_tel_4 =Faker::Company.australian_business_number
 # company_call_number_contact_name_5 =Faker::Name.name
 # company_call_number_contact_tel_5 =Faker::Company.australian_business_number
 # company_call_number_contact_name_6 =Faker::Name.name
 # company_call_number_contact_tel_6 =Faker::Company.australian_business_number
 # company_call_time_from_1 = Faker::Number.between(0, 23)
 # company_call_time_from_2 = Faker::Number.between(0, 59) 
 # company_call_time_to_1 = Faker::Number.between(0, 23)
 # company_call_time_to_2 = Faker::Number.between(0, 59) 
 # company_fax_number_contact =Faker::Company.australian_business_number
 # company_call_number_emergency =Faker::Company.australian_business_number
 # company_url = Faker::Internet.url
 # company_mail_address = "user-#{n+1}@example.com"
 # company_place_detail_contact = "○○市○○区○○町○○番地○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○ビル"
 # company_pr = Faker::Company.catch_phrase
 # @bank_name = ["みずほ銀行", "北洋銀行", "三菱UFJ銀行"]
 # bank_name = @bank_name.shuffle.sample
 # @bank_branch = ["札幌支店", "京都支店", "大阪支店"]
 # bank_branch = @bank_branch.shuffle.sample
 # @bank_username = ["ｶﾌﾞｼｷｶﾞｲﾎﾆｬﾗﾗｼｬ"]
 # bank_username = @bank_username.shuffle.sample
 # @bank_type = ["普通"]
 # bank_type = @bank_type.shuffle.sample
 # bank_number = Faker::Number.number(7)
 
 
User.create!(name: "jizokm",
             email: "jizokm@gmail.com",
             password: "caster39",
             password_confirmation: "caster39",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now,
             
              # company_name: company_name,
              # company_name_sounds: company_name_sounds,
              # company_president: company_president,
              # company_president_sound: company_president_sound,
              # company_post_number: company_post_number,
              # company_place: company_place,
              # company_place_detail: company_place_detail,
              # company_call_number: company_call_number,
              # company_fax_number: company_fax_number,
              # company_branch: company_branch,
              # company_type: company_type,
              # company_union: company_union,
              # company_reception: company_reception,
              # company_reception_sound: company_reception_sound,
              # company_position: company_position,
              # company_post_number_contact: company_post_number_contact,
              # company_place_contact: company_place_contact,
              # company_call_number_contact: company_call_number_contact,
              # company_call_number_contact_name_1: company_call_number_contact_name_1,
              # company_call_number_contact_tel_1: company_call_number_contact_tel_1,
              # company_call_number_contact_name_2: company_call_number_contact_name_2,
              # company_call_number_contact_tel_2: company_call_number_contact_tel_2,
              # company_call_number_contact_name_3: company_call_number_contact_name_3,
              # company_call_number_contact_tel_3: company_call_number_contact_tel_3,
              # company_call_number_contact_name_4: company_call_number_contact_name_4,
              # company_call_number_contact_tel_4: company_call_number_contact_tel_4,
              # company_call_number_contact_name_5: company_call_number_contact_name_5,
              # company_call_number_contact_tel_5: company_call_number_contact_tel_5,
              # company_call_number_contact_name_6: company_call_number_contact_name_6,
              # company_call_number_contact_tel_6: company_call_number_contact_tel_6,
              # company_call_time_from_1: company_call_time_from_1,
              # company_call_time_from_2: company_call_time_from_2,
              # company_call_time_to_1: company_call_time_to_1,
              # company_call_time_to_2: company_call_time_to_2,
              # company_fax_number_contact: company_fax_number_contact,
              # company_call_number_emergency: company_call_number_emergency,
              # company_url: company_url,
              # company_mail_address: company_mail_address,
              # company_place_detail_contact: company_place_detail_contact,
              # company_pr: company_pr,
              # bank_name: bank_name,
              # bank_branch: bank_branch,
              # bank_username: bank_username,
              # bank_type: bank_type,
              # bank_number: bank_number
             )
end    
