# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Admin User",
             email: "admin@example.com",
             password:  "123456",
             password_confirmation: "123456",
             admin: true)

# I commented this part
#------------------------
# 30.times do |n|
#     name = Faker::Name.name
#     email = "user-#{n+1}@example.com"
#     password = "123456"
#     User.create!(name: name, 
#                 email: email,
#                 password: password,
#                 password_confirmation: password)
#     end

# users = User.order(:created_at).take(6)
# 50.times do
#     content = Faker::Lorem.sentence(5)
#     users.each { |user| user.microposts.create!(content: content)}
# end


# 10.times do |n|
#     name = Faker::Name.name
#     maker = Faker::Name.name
    
#     @places = ["北海道", "神奈川県", "滋賀県", "大阪府", "京都府"]
    
#     #random_place = @places.shuffle.sample
#     random_place = @places.shuffle.first
    
#     Sell.create!(name: name, maker: maker, place: random_place)
    
  
#     # places.each do |place|
#       #Sell.create!({:place => random_place})
#     # end
    
#       # [ "北海道", "神奈川県", "滋賀県", "大阪府", "京都府"].each do |place|
#       #   Sell.create!({:place => place})
#       # end
      
#     end
    
    
# 500.times do |n|
#  number = Faker::Number.between(1, 10)
#  user_id = Faker::Number.number(1)
#  detail_id = Faker::Number.number(1)
#  price = Faker::Number.number(6)
#  removal_date = Faker::Time.between(DateTime.now - 1, DateTime.now)
 
#  @maker = ["サミー", "京楽", "オリンピア", "藤商事", "タイヨーエレック", "ＥＸＣＩＴＥ"]
#  @name = ["ＣＲ戦国乙女４～花～３１９ｖｅｒ．【Ｈ１ＢＹ８】", "ＣＲルパン三世～Ｉ’ｍ　ａ　ｓｕｐｅｒ　ｈｅｒｏ～不二子におまかせ　１７８ｖｅｒ．【８Ｌ７ＢＺ】", "ＣＲ火曜サスペンス劇場２ＬＫＩ　真相の扉～２２の過ち～", "ＣＲ天元突破グレンラガン　ラゼンガンＶｅｒ．【ＬＮＡ】", "  デジハネＣＲスーパーロボット大戦ＯＧＱＴＡ【甘デジ】"]
#  @places = ["北海道", "神奈川県", "滋賀県", "大阪府", "京都府"]
#  @remnant = ["あり", "無し"]
#  @type_machine = ["本体", "セル"]
#  @condition = ["A", "B", "C"]
#  @stage = ["１次", "２次"]
#  @remarks = ["ボッロボロ", "綺麗", "担当は山田", "値段要相談", "送料別（１０００円）"]

#  name = @name.shuffle.sample
#  maker = @maker.shuffle.sample
#  place = @places.shuffle.sample
#  remnant = @remnant.shuffle.sample
#  stage = @stage.shuffle.sample
#  condition = @condition.shuffle.sample
#  remarks = @remarks.shuffle.sample
#  type_machine = @type_machine.shuffle.sample
#  status = "受付"
#  #カスタムのseedはそもそもfakerプラグインは使わない。


#With 
#number: number
#user_id: user_id#detail_id: detail_id

#MASA - SELL TABLE 

# Sell.create!(name: name,
#               maker: maker,
#               number: number,
#               user_id: user_id,
#               detail_id: detail_id,
#               place: place,
#               price: price,
#               removal_date: removal_date.strftime("%y/%m/%d"),
#               remnant: remnant,
#               stage: stage,
#               condition: condition,
#               remarks: remarks,
#               type_machine: type_machine,
#               status: status
#               )
# end

# #GRACE - SELL TABLE
# Sell.create!( name: name,
#               maker: maker,
#               place: place,
#               type_machine: type_machine,
#               remarks: remarks,
#               condition: condition,
#               stage: stage,
#               remnant: remnant,
#               )
# end

15.times do |n|

  name = Faker::Company.name
  company_name_sounds = "かぶしきがいしゃ#{n+1}"
 
  email = "user-#{n+1}-#{n+1}@example.com"
  password = "password"
 
  company_president = Faker::Name.name
  company_president_sound = "しゃちょーのなまえ"
  company_post_number = Faker::Company.duns_number
 
  @places = ['北海道', '神奈川県', '滋賀県', '大阪府', '京都府']
  company_place = @places.shuffle.sample
    
  company_place_detail = "○○市○○区○○町○○番地○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○ビル"

  company_call_number = Faker::Company.australian_business_number
  company_fax_number = Faker::Company.australian_business_number
  company_branch = "○○県○○市○○区○○町○○番地○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○ビル1201"
  @company_type = ["販社", "店舗"]
  company_type = @company_type.shuffle.sample
  
  @company_union = ["北海道", "店舗"]
  company_union = @company_union.shuffle.sample
  
  company_reception = Faker::Name.name
  company_reception_sound = "たんとうのなまえ"
  
  @company_position = ["事務", "会計", "副社長"]
  company_position = @company_position.shuffle.sample

  company_post_number_contact = Faker::Address.postcode
  
  @company_place_contact = ["北海道", "神奈川県", "滋賀県", "大阪府", "京都府"]
  company_place_contact = @company_place_contact.shuffle.sample
  
  
  company_call_number_contact = Faker::Company.australian_business_number
  company_call_number_contact_name_1 =Faker::Company.duns_number
  company_call_number_contact_tel_1 =Faker::Company.australian_business_number
  company_call_number_contact_name_2 =Faker::Company.duns_number
  company_call_number_contact_tel_2 =Faker::Company.australian_business_number
  company_call_number_contact_name_3 =Faker::Company.duns_number
  company_call_number_contact_tel_3 =Faker::Company.australian_business_number
  company_call_number_contact_name_4 =Faker::Company.duns_number
  company_call_number_contact_tel_4 =Faker::Company.australian_business_number
  company_call_number_contact_name_5 =Faker::Company.duns_number
  company_call_number_contact_tel_5 =Faker::Company.australian_business_number
  company_call_number_contact_name_6 =Faker::Company.duns_number
  company_call_number_contact_tel_6 =Faker::Company.australian_business_number
  
  company_call_time_from_1 = Faker::Number.between(0, 23)
  company_call_time_from_2 = Faker::Number.between(0, 59) 
  
  company_call_time_to_1 = Faker::Number.between(0, 23)
  company_call_time_to_2 = Faker::Number.between(0, 59) 
  
  company_fax_number_contact =Faker::Company.australian_business_number
  company_call_number_emergency =Faker::Company.australian_business_number
  company_url = Faker::Internet.url
  company_mail_address = "user-#{n+1}@example.com"
  company_place_detail_contact = "○○市○○区○○町○○番地○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○ビル"
  company_pr = Faker::Company.catch_phrase
 
 
User.create!(name: name, 
              email: email,
              password: password,
              password_confirmation: password)
 
 
Detail.create!(company_name: name,
              company_name_sounds: company_name_sounds,
              company_president: company_president,
              company_president_sound: company_president_sound,
              company_post_number: company_post_number,         
              company_place: company_place, 
              company_place_detail: company_place_detail,
              company_call_number: company_call_number,
              company_fax_number: company_fax_number,
              company_branch: company_branch,
              company_type: company_type,
              company_union: company_union,
              company_reception: company_reception,
              
              company_reception_sound: company_reception_sound,
              
              company_position: company_position,
              
              company_post_number_contact: company_post_number_contact,
              
              company_place_contact: company_place_contact,
  
              company_call_number_contact: company_call_number_contact,
              company_call_number_contact_name_1: company_call_number_contact_name_1,
              company_call_number_contact_tel_1: company_call_number_contact_tel_1,
              company_call_number_contact_name_2: company_call_number_contact_name_2,
              company_call_number_contact_tel_2: company_call_number_contact_tel_2,
              company_call_number_contact_name_3: company_call_number_contact_name_3,
              company_call_number_contact_tel_3: company_call_number_contact_tel_3,
              company_call_number_contact_name_4: company_call_number_contact_name_4,
              company_call_number_contact_tel_4: company_call_number_contact_tel_4,
              company_call_number_contact_name_5: company_call_number_contact_name_5,
              company_call_number_contact_tel_5: company_call_number_contact_tel_5,
              company_call_number_contact_name_6: company_call_number_contact_name_6,
              company_call_number_contact_tel_6: company_call_number_contact_tel_6,
              
              company_call_time_from_1: company_call_time_from_1,
              company_call_time_from_2: company_call_time_from_2,
              
              company_call_time_to_1: company_call_time_to_1,
              company_call_time_to_2: company_call_time_to_2,
              
              company_fax_number_contact: company_fax_number_contact,
              company_call_number_emergency: company_call_number_emergency,
              company_url: company_url,
              company_mail_address: company_mail_address,
              company_place_detail_contact: company_place_detail_contact,
              company_pr: company_pr
              
              )
end


              
              
              

#ORIGINAL CODE
#-------------------------------------------------

# 30.times do |n|

# name = Faker::Company.name
# company_name_sounds = "かぶしきがいしゃ#{n+1}"
# email = "user-#{n+1}-#{n+1}@example.com"
# password = "password"
# company_president = Faker::Name.name
# company_president_sound = "しゃちょーのなまえ"
# company_post_number = Faker::Company.duns_number
# @places = ["北海道", "神奈川県", "滋賀県", "大阪府", "京都府"]
# company_place = @places.shuffle.sample
# company_place_detail = "○○市○○区○○町○○番地○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○ビル"
# company_call_number = Faker::Company.australian_business_number
# company_fax_number = Faker::Company.australian_business_number
# company_branch = "○○県○○市○○区○○町○○番地○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○ビル1201"
# @company_type = ["販社", "店舗"]
# company_type = @company_type.shuffle.sample
# @company_union = ["北海道", "店舗"]
# company_union = @company_union.shuffle.sample
# company_reception = Faker::Name.name
# company_reception_sound = "たんとうのなまえ"
# @company_position = ["事務", "会計", "副社長"]
# company_position = @company_position.shuffle.sample
# company_post_number_contact = Faker::Address.postcode
# company_place_contact = ["北海道", "神奈川県", "滋賀県", "大阪府", "京都府"]
# company_call_number_contact = Faker::Company.australian_business_number
# company_call_number_contact_name_1 =Faker::Company.duns_number
# company_call_number_contact_tel_1 =Faker::Company.australian_business_number
# company_call_number_contact_name_2 =Faker::Company.duns_number
# company_call_number_contact_tel_2 =Faker::Company.australian_business_number
# company_call_number_contact_name_3 =Faker::Company.duns_number
# company_call_number_contact_tel_3 =Faker::Company.australian_business_number
# company_call_number_contact_name_4 =Faker::Company.duns_number
# company_call_number_contact_tel_4 =Faker::Company.australian_business_number
# company_call_number_contact_name_5 =Faker::Company.duns_number
# company_call_number_contact_tel_5 =Faker::Company.australian_business_number
# company_call_number_contact_name_6 =Faker::Company.duns_number
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
 
# # User.create!(name: name,
# #               email: email,
# #               password: password,
# #               password_confirmation: password,
# #               activated: true,
# #               activated_at: Time.zone.now
# #               )
             
# UserDetail.create!(company_name: name,
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
#               company_pr: company_pr
#               )
# end

   
