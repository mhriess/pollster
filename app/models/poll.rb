class Poll < ActiveRecord::Base
  attr_accessible :name, :vanity_url
  before_save :generate_edit_code
  
  has_many :questions
  
  private
  
  def generate_edit_code
    self.edit_url = (0...8).map{65.+(rand(26)).chr}.join
  end
end
