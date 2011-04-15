class Mesh < ActiveRecord::Base
  #not shure if this is correct
  has_and_belongs_to_many :questions
end
