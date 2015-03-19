class Review < ActiveRecord::Base

  attr_accessible :profile_id, :recommendation, :review, :score, :contact, 
    :reviewer_first, :reviewer_last, :user_id, :user_name, :city, :product_description, :public, :invitation_id

  belongs_to :profile
  belongs_to :invitation

  validates_presence_of :score, :reviewer_first, :reviewer_last
  validates :recommendation, inclusion: { in: [ true, false ], message: "can't be blank" }

  def sharable?
    self.score > 3 && self.recommendation
  end

end
