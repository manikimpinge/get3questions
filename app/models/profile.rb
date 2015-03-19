class Profile < ActiveRecord::Base
  attr_accessible :address, :business_name, :city, :phone, :state, :zip, :image, :description, 
    :image_file_name, :image_content_type, :image_updated_at, :image_file_size,:user_id, :website, :review_link, :review_name, :product_question, :product_placeholder, :page_header, :page_color

  validates :address, :business_name, :city, :phone, :state, :zip, :description, presence: true

  belongs_to :user

  has_many :reviews
  has_many :invitations

  has_attached_file :image,
    styles: {
    #thumb: '100x100>',
    #square: '200x200#',
    standard: [ "300x300>", :png ],
    rating_4_stars: { processors: [ :thumbnail, :watermark ], watermark_type: :four_stars, geometry: "300x300>" },
    rating_5_stars: { processors: [ :thumbnail, :watermark ], watermark_type: :five_stars, geometry: "300x300>" }
  },
  default_style: :standard
  
  has_attached_file :page_header,
    styles: {
    standard: [ "300x300>", :png ],
  },
  default_style: :standard

  def recommended_percentage
    return 0.0 if reviews.blank?
    100 * reviews.where(recommendation: true).count / reviews.count
  end

  def average_score
    return 0.0 if reviews.blank?
    (self.reviews.average(:score) * 2).round / 2.0
  end

  def to_param
    if self.id.present? && self.business_name.present?
      [ self.id, self.business_name.parameterize].join("-")
    else
      super
    end
  end

end
