require "helper"

class TestIntegrationAssertions < ActionDispatch::IntegrationTest
  def test_assert_response
    get models_path
    assert_response :success
  end

  def test_assert_redirected_to
    get new_model_path
    assert_redirected_to :models
  end

  def test_routing_assertions
    params = { :controller => "models", :action => "index" }
    path = "/models"
    assert_generates path, params
    assert_recognizes params, path
    assert_routing path, params
  end

  def test_assert_dom_equal
    apple_link = '<a href="http://www.example.com" target="_blank">Apples</a>'
    apple_link2 = '<a target="_blank" href="http://www.example.com">Apples</a>'
    orange_link = '<a href="http://www.example.com">Oranges</a>'

    assert_dom_equal apple_link, apple_link2
    refute_dom_equal apple_link, orange_link
    assert_dom_not_equal apple_link, orange_link
  end

  def test_assert_select
    get models_path
    assert_select "body h1"
    assert_select "body" do
      assert_select "h1"
    end
  end
end
