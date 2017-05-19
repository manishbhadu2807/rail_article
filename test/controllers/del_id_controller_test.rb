require 'test_helper'

class DelIdControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get del_id_index_url
    assert_response :success
  end

end
