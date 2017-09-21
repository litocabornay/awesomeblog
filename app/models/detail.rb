class Detail < ActiveRecord::Base
   belongs_to :user
  # user:references で自動生成
#————— 
  default_scope -> { order(created_at: :desc) }
  # scope - 絞り込み
  # asc - ascending A-Z previousがはじめ
  # desc - descending Z-A Latestがはじめ
#————— 
  validates :user_id, presence: true,
  uniqueness: { case_sensitive: false }
  
  validates :company_name, presence: true
  validates :company_name_sounds, presence: true
  validates :company_reception, presence: true
  validates :company_president, presence: true
  validates :company_president_sound, presence: true
  validates :company_post_number, presence: true
  validates :company_place, presence: true
  validates :company_place_detail, presence: true
  validates :company_call_number, presence: true
 # validates :company_fax_number, presence: true
 # validates :company_branch, presence: true
  validates :company_type, presence: true
  validates :company_union, presence: true
  validates :company_reception_sound, presence: true
  validates :company_position, presence: true
  validates :company_post_number_contact, presence: true
  validates :company_call_time_from_1, presence: true
  validates :company_call_time_from_2, presence: true
  validates :company_call_time_to_1, presence: true
  validates :company_call_time_to_2, presence: true
 # validates :company_fax_number_contact, presence: true
  validates :company_call_number_emergency, presence: true
 # validates :company_url, presence: true
  validates :company_mail_address, presence: true
  validates :company_place_detail_contact, presence: true
 # validates :company_pr, presence: true



    
    
  #content = からむの名前
  #presence、ってのはつまり必須かそうでないか
end
