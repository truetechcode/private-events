require 'test_helper'

class EventAttendanceControllerTest < ActionDispatch::IntegrationTest
  test "should get attend" do
    get event_attendance_attend_url
    assert_response :success
  end

end
