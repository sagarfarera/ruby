require "test_helper"

class EntitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entity = entities(:one)
  end

  test "should get index" do
    get entities_url
    assert_response :success
  end

  test "should get new" do
    get new_entity_url
    assert_response :success
  end

  test "should create entity" do
    assert_difference('Entity.count') do
      post entities_url, params: { entity: { cart_id: @entity.cart_id, product_id: @entity.product_id } }
    end

    assert_redirected_to entity_url(Entity.last)
  end

  test "should show entity" do
    get entity_url(@entity)
    assert_response :success
  end

  test "should get edit" do
    get edit_entity_url(@entity)
    assert_response :success
  end

  test "should update entity" do
    patch entity_url(@entity), params: { entity: { cart_id: @entity.cart_id, product_id: @entity.product_id } }
    assert_redirected_to entity_url(@entity)
  end

  test "should destroy entity" do
    assert_difference('Entity.count', -1) do
      delete entity_url(@entity)
    end

    assert_redirected_to entities_url
  end

  test "should create entity via ajax" do
    assert_difference( 'entity.count') do
    post entities_url, params: { product_id: products( :ruby).id },
    xhr: true
    end
    assert_response :success
    assert_match /<tr class=\\"line-item-highlight/, @response.body
   end
   
end
