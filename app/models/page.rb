# == Schema Information
#
# Table name: pages
#
#  id         :integer(4)      not null, primary key
#  subject_id :integer(4)
#  name       :string(255)
#  permalink  :string(255)
#  position   :integer(4)
#  visible    :boolean(001)      default(FALSE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'position_mover'
class Page < ActiveRecord::Base

  include PositionMover
  attr_accessible :name, :subject_id, :permalink, :visible, :content_type, :content

  belongs_to :subject
  CONTENT_TYPES = ['text', 'HTML']

  # has_and_belongs_to_many :editors, :class_name => "AdminUser"

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence with length to disallow spaces
  validates_uniqueness_of :permalink
  # for unique values by subject, :scope => :subject_id

  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
                         :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  #validates_presence_of :content

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('pages.position ASC')

  private

  def position_scope
    "pages.subject_id = #{subject_id.to_i}"
  end

end
