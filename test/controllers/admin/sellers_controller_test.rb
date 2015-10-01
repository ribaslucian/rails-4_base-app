require 'test_helper'

class Admin::SellersControllerTest < ActionController::TestCase
  setup do
    @admin_seller = admin_sellers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_sellers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_seller" do
    assert_difference('Admin::Seller.count') do
      post :create, admin_seller: { cnpj: @admin_seller.cnpj, corporate: @admin_seller.corporate, name: @admin_seller.name }
    end

    assert_redirected_to admin_seller_path(assigns(:admin_seller))
  end

  test "should show admin_seller" do
    get :show, id: @admin_seller
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_seller
    assert_response :success
  end

  test "should update admin_seller" do
    patch :update, id: @admin_seller, admin_seller: { cnpj: @admin_seller.cnpj, corporate: @admin_seller.corporate, name: @admin_seller.name }
    assert_redirected_to admin_seller_path(assigns(:admin_seller))
  end

  test "should destroy admin_seller" do
    assert_difference('Admin::Seller.count', -1) do
      delete :destroy, id: @admin_seller
    end

    assert_redirected_to admin_sellers_path
  end
end
