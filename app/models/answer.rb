class Answer < ActiveRecord::Base
	belongs_to :question
  belongs_to :user
  #belongs_to :author, :class_name => :user
	has_many :users, :through => :votes
  has_many :votes, :dependent => :destroy



end
