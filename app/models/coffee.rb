class Coffee < ApplicationRecord
    belongs_to :brand
    belongs_to :user #creator of it 
    has_many :reviews 
    has_many :users, through: :reviews #people who have reviewed it

    validates :flavor, presence: true 
    validate :not_a_duplicate 

    scope :order_by_rating, -> {joins(:reviews).group(:id).order('avg(stars) desc')}

    def self.alpha
        order(:flavor)
    end 


    def brand_attributes=(attributes)
        brand = Brand.find_or_create_by(attributes) if 
        !attributes['name'].empty?
    end 



    def not_a_duplicate 
        if Coffee.find_by(flavor: flavor, brand_id: brand_id)
            errors.add(:flavor, "has already been added for that brand, try again!")
        end 
    end 

    def flavor_and_brand
        "#{flavor} - #{brand.name}"
    end 
end
