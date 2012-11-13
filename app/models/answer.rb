class Answer < ActiveRecord::Base
  attr_accessible :body, :poll_id
  belongs_to :question
end
