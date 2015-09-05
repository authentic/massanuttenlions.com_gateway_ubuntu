class User < ActiveRecord::Base
  has_many :assignments
  has_many :roles, :through => :assignments
  #accepts_nested_attributes_for :roles, :allow_destroy=>true

  has_attached_file :avatar, :styles => {:small => "X100", :medium => "X160", :large => "300x", :thumb => "70x"}, :url => "/paperclip_assets/users/:id_partition/:style/:basename.:extension", :path => ":rails_root/public/paperclip_assets/users/:id_partition/:style/:basename.:extension"
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,  :timeoutable, :token_authenticatable#, :lockable,:confirmable , :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_name, :email, :password, :password_confirmation, :remember_me, :confirmed_at, :current_password,
                  :first_name, :last_name, :spouse_first_name, :birthday,
                  :member_as_of, :biography, :street, :house_number, :postal_code,
                  :city, :state, :phone, :status, :leadership,
                  :officers, :signature, :avatar, :webmaster, :newsletter_editor, :photographer, :role_ids, :roles_attributes

  # attr_accessible :title, :body
  validates_presence_of :user_name
  validates_uniqueness_of :user_name, :case_sensitive => false
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :birthday
  validates_presence_of :street
  validates_presence_of :house_number
  validates_presence_of :postal_code
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :phone
  validates_presence_of :signature
  validates_presence_of :email, :if => :email_required?
  validates_format_of :email, :with => EMAIL_REGEX, :allow_blank => true, :if => :email_changed?
  validates_presence_of :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of :password, :within => 8..25, :on => :create, :allow_blank => true


  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end


  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:current_password)
      self.update_without_password(params)
    else
      self.verify_password_and_update(params)
    end
  end

  def update_without_password(params={})

    params.delete(:password)
    params.delete(:password_confirmation)
    result = update_attributes(params)
    clean_up_passwords
    result
  end

  def verify_password_and_update(params)
    #devises' update_with_password
    # https://github.com/plataformatec/devise/blob/master/lib/devise/models/database_authenticatable.rb
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if valid_password?(current_password)
               update_attributes(params)
             else
               self.attributes = params
               self.valid?
               self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
               false
             end

    clean_up_passwords
    result
  end

  protected
  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    true
  end

  scope :sorted, order("users.last_name ASC, users.first_name ASC")
  scope :sorted_by_officers, order("FIELD (users.officers, 'LOMFI President', 'LOMFI Vice President', 'LOMFI Secretary', 'LOMFI Treasurer', 'LOMFI Director')")
  scope :sorted_by_leadership, order("FIELD (users.leadership, 'President', 'Vice President', 'Secretary', 'Treasurer', 'Lion Tamer', 'Tail Twister', 'Membership Chair', 'Director 2 Year', 'Past President' )")

  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }
end
