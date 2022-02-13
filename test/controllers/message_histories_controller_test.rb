require "test_helper"

class MessageHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_history = message_histories(:one)
  end

  test "should get index" do
    get message_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_message_history_url
    assert_response :success
  end

  test "should create message_history" do
    assert_difference('MessageHistory.count') do
      post message_histories_url, params: { message_history: { date_sent: @message_history.date_sent, message_id: @message_history.message_id, student_id: @message_history.student_id } }
    end

    assert_redirected_to message_history_url(MessageHistory.last)
  end

  test "should show message_history" do
    get message_history_url(@message_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_history_url(@message_history)
    assert_response :success
  end

  test "should update message_history" do
    patch message_history_url(@message_history), params: { message_history: { date_sent: @message_history.date_sent, message_id: @message_history.message_id, student_id: @message_history.student_id } }
    assert_redirected_to message_history_url(@message_history)
  end

  test "should destroy message_history" do
    assert_difference('MessageHistory.count', -1) do
      delete message_history_url(@message_history)
    end

    assert_redirected_to message_histories_url
  end
end
