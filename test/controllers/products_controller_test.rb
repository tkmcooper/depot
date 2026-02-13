require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { description: "New description", price: 19.99, title: "NewProduct", image: fixture_file_upload("lorem.jpg", "image/jpeg") } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: @product.description, price: @product.price, title: "UpdatedTitle", image: fixture_file_upload("lorem.jpg", "image/jpeg") } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_raises ActiveRecord::RecordNotDestroyed do
      delete product_url(products(:two))
    end

    assert Product.exists?(products(:two).id)
  end
end
