class AddActivation2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :money, :integer,                         default: 0
    add_column :users, :money_yet, :integer,                         default: 0
    add_column :users, :company_name_sounds, :string
    add_column :users, :company_reception, :string
    add_column :users, :company_president, :string
    add_column :users, :company_president_sound, :string
    add_column :users, :company_post_number, :string
    add_column :users, :company_place, :string
    add_column :users, :company_place_detail, :string
    add_column :users, :company_call_number, :string
    add_column :users, :company_fax_number, :string
    add_column :users, :company_branch, :string
    add_column :users, :company_type, :string
    add_column :users, :company_union, :string
    add_column :users, :company_reception_sound, :string
    add_column :users, :company_position, :string
    add_column :users, :company_post_number_contact, :string
    add_column :users, :company_place_contact, :string
    add_column :users, :company_call_number_contact, :string
    add_column :users, :company_call_number_contact_name_1, :string
    add_column :users, :company_call_number_contact_tel_1, :string
    add_column :users, :company_call_number_contact_name_2, :string
    add_column :users, :company_call_number_contact_tel_2, :string
    add_column :users, :company_call_number_contact_name_3, :string
    add_column :users, :company_call_number_contact_tel_3, :string
    add_column :users, :company_call_number_contact_name_4, :string
    add_column :users, :company_call_number_contact_tel_4, :string
    add_column :users, :company_call_number_contact_name_5, :string
    add_column :users, :company_call_number_contact_tel_5, :string
    add_column :users, :company_call_number_contact_name_6, :string
    add_column :users, :company_call_number_contact_tel_6, :string
    add_column :users, :company_call_time_from_1, :string
    add_column :users, :company_call_time_from_2, :string
    add_column :users, :company_call_time_to_1, :string
    add_column :users, :company_call_time_to_2, :string
    add_column :users, :company_fax_number_contact, :string
    add_column :users, :company_call_number_emergency, :string
    add_column :users, :company_url, :string
    add_column :users, :company_mail_address, :string
    add_column :users, :company_place_detail_contact, :string
    add_column :users, :company_pr, :text
  end
end
