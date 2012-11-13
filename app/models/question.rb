class Question < ActiveRecord::Base
  attr_accessible :description
  belongs_to :poll
end
