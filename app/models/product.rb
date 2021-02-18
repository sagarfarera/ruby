class Product < ApplicationRecord
  has_many :entities

  before_destroy :make_sure_not_refered_in_any_entity

  #validation 
  #mandatory fields
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
   }
   validates :price, numericality: { :only_integer => true , greater_than_or_equal_to: 0.01 }

   #task- 
   validates :title, length: {minimum: 4}

  private 
  private
    # ensure that there are no line items referencing this product
    def make_sure_not_refered_in_any_entity
      unless entities.empty?
        errors.add( :base, 'Entity present')
        throw :abort
      end
    end

end
  

