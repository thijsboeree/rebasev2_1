class Question < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :dependent => :destroy
	has_many :answers, :dependent => :destroy
  has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:text].blank? }, 
                                :allow_destroy => true

  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, 
                                :allow_destroy => true


  
  

	has_and_belongs_to_many :meshes #not shure if this is correct

  
           
	
	def can_vote_on? question
    !question.answers.joins(:votes).where('votes.user_id = ?', id).exists?
  end

end
