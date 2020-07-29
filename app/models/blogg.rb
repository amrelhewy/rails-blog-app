class Blogg < ApplicationRecord
  belongs_to :user
  validates :blog_name,:blog,:blog_genre , presence: true
  
  
end
