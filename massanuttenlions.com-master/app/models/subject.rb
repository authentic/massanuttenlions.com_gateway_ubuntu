# == Schema Information
#
# Table name: subjects
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  position   :integer(4)
#  visible    :boolean(001)      default(FALSE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'position_mover'
class Subject < ActiveRecord::Base

  attr_accessible :name, :visible
  include PositionMover
  has_many :pages
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('subjects.position ASC')
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
end
