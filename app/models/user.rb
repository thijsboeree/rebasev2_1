class User < ActiveRecord::Base



  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
	
	has_many :questions
	has_many :answers
  has_many :answers_given, :through => :votes, :source => :answer, :foreign_key => :answer_id
 
												# ,:through => :answers, :source => :question, :foreign_key => :question_id

	has_many :questions_answered 
  has_many :votes
	has_many :comments

	has_many :friendships
	has_many :friends, :through => :friendships
	
		
	def to_s
		email
	end

	def can_vote_on? (question)
    !question.answers.joins(:votes).where('votes.user_id = ?', id).exists?
  end

  def voted_answer? (answer)
    answer.votes.where('votes.user_id = ?', id).exists?
  end




end
