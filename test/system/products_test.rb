require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    # setup

    # exercise
    visit root_url

    # verify
    # assert_text "Skello"
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count

    # teardown
  end

  test "lets a signed in user create a new product" do
    # setup
    # login_as users(:george)

    # exercise
    visit "/products/new"
    # save_and_open_screenshot

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # save_and_open_screenshot

    click_on 'Create Product'
    # save_and_open_screenshot

    # verify
    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"
  end
end
