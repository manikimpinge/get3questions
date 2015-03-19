class Invitation < ActiveRecord::Base

  attr_accessible :email, :first_name, :last_name, :phone, :medium, :profile_id

  belongs_to :user
  has_one :review
  belongs_to :profile

  validates :first_name, :last_name, :medium, presence: true

  validates :email, format: { with: /\A[^@]+@[^@]+\z/, message: "Please enter a valid email", if: :medium_email? }
  validates :phone, format: { with: /^\d{3}-\d{3}-\d{4}$/, message: "Please enter a 10 digit phone number
                              without country code, spaces, dashes or any other character", if: :medium_phone? }

  def medium_email?
    self.medium == "email"
  end

  def medium_phone?
    self.medium == "phone"
  end

  def phone_with_country_code
    "+1#{self.phone.gsub('-','')}"
  end

end
