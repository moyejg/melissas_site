require 'test_helper'

class SiteControllerTest < ActionDispatch::IntegrationTest
  test "should get gallery" do
    get site_gallery_url
    assert_response :success
  end

end
