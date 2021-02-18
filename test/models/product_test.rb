require "test_helper"

class ProductTest < ActiveSupport::TestCase
#First Validation test
  # test "Mandatory Fields" do
  #   product = Product.new
  #   assert product.invalid?
  #   assert product.errors[ :title].any?
  #   assert product.errors[ :description].any?
  #   assert product.errors[ :price].any?
  #   assert product.errors[ :image_url].any?
  #  end   


#Price check validation test
  # test "Price must be Postive and must be meintioned" do
  #   product = Product.new( title: "My Book Title",
  #   description: "yyy",
  #   image_url: "zzz.jpg")
  #   product.price = -1
  #   assert product.invalid?
  #   assert_equal [ "must be greater than or equal to 0.01"], product.errors[ :price]

  #   product.price = 0
  #   assert product.invalid?
  #   assert_equal [ "must be greater than or equal to 0.01"], product.errors[ :price]


  #   product.price = 1
  #   assert product.valid?
  # end

# Testing for image url 

  def genrate_product(image_url)
    #making implicite function to create an object of product with provided urls
    Product.new(title: "Test Book",description: "it's description", price: 1, image_url: image_url)
  end

  test "Url Testing " do 
    #not much familiar with regex so using directly for book 
    
    correct_urls =  %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    incorrect_urls = %w{ fred.doc fred.gif/more fred.gif.more }

    correct_urls.each do |image_url|
      assert genrate_product(image_url).valid?, "Failure Message: Not correct url not included in regex of image_validation format check it #{image_url}"
    end

    incorrect_urls.each do |image_url|
      assert genrate_product(image_url).invalid?, "Failure Message: correct url means accepted in validation check it #{image_url}"
    end


  end


  test "Minimum chacters in title task" do
    correct_product = Product.new(title: "Test Book",description: "it's description", price: 1, image_url: "fred.png")
    incorrect_product = Product.new(title: "abc",description: "it's description", price: 1, image_url: "fred.png")

    assert correct_product.valid?,"validation not working on title"
    assert incorrect_product.invalid?,"validation not working on title, making title less than 4 character"
  
  end

end