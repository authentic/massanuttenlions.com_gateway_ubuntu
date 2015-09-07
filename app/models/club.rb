# == Schema Information
#
# Table name: clubs
#
#  id                      :integer(4)      not null, primary key
#  name                    :string(255)
#  meeting_address         :string(255)
#  mailing_address         :string(255)
#  city                    :string(255)
#  postal_code             :string(255)
#  state                   :string(255)     default("Virginia")
#  email                   :string(255)
#  president_email         :string(255)
#  webmaster_email         :string(255)
#  newsletter_editor_email :string(255)
#  secretary_email         :string(255)
#  photographer_email      :string(255)
#  phone                   :string(255)
#  current_year            :string(255)
#  avatar_file_size        :integer(4)
#  avatar_file_name        :string(255)
#  avatar_updated_at       :datetime
#  avatar_content_type     :string(255)
#  created_at              :datetime        not null
#  updated_at              :datetime        not null
#

class Club < ActiveRecord::Base

  has_attached_file :avatar, :styles => {:small => "X100", :medium => "X166", :large => "300x", :thumb => "60x"}, :url => "/paperclip_assets/club_info/:id_partition/:style/:basename.:extension", :path => ":rails_root/public/paperclip_assets/club_info/:id_partition/:style/:basename.:extension"

  attr_accessible :name, :meeting_address, :mailing_address, :postal_code, :state, :email,
                  :president_email, :webmaster_email, :phone, :current_year, :city, :newsletter_editor_email, :secretary_email, :avatar, :photographer_email, :lomfi_president_email, :treasurer_email


  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :name
  validates_presence_of :meeting_address
  validates_presence_of :mailing_address
  validates_presence_of :postal_code, :maximum => 5
  validates_presence_of :email
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => EMAIL_REGEX
  validates_presence_of :president_email
  validates_length_of :president_email, :maximum => 100
  validates_format_of :president_email, :with => EMAIL_REGEX
  validates_presence_of :webmaster_email
  validates_length_of :webmaster_email, :maximum => 100
  validates_format_of :webmaster_email, :with => EMAIL_REGEX
  validates_presence_of :newsletter_editor_email
  validates_length_of :newsletter_editor_email, :maximum => 100
  validates_format_of :newsletter_editor_email, :with => EMAIL_REGEX
  validates_presence_of :secretary_email
  validates_length_of :secretary_email, :maximum => 100
  validates_format_of :secretary_email, :with => EMAIL_REGEX
  validates_presence_of :phone
  validates_presence_of :current_year

end
