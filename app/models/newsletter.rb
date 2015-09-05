class Newsletter < ActiveRecord::Base

  # attr_accessible :title, :body
  validates_presence_of :period
  validates_uniqueness_of :period
  attr_accessible :header, :footer, :content, :visible, :period
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('newsletters.month ASC')


end
# == Schema Information
#
# Table name: newsletters
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  header     :text
#  footer     :text
#  content    :text            default(""), not null
#  visible    :boolean(001)      default(FALSE)
#  period     :date
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

