require 'test_helper'

class HomiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homily = homilies(:one)
  end

  test "should get index" do
    get homilies_url
    assert_response :success
  end

  test "should get new" do
    get new_homily_url
    assert_response :success
  end

  test "should create homily" do
    assert_difference('Homily.count') do
      post homilies_url, params: { homily: { cycle: @homily.cycle, date: @homily.date, first_reading_book: @homily.first_reading_book, first_reading_chapter: @homily.first_reading_chapter, first_reading_verse: @homily.first_reading_verse, gospel_book: @homily.gospel_book, gospel_chapter: @homily.gospel_chapter, gospel_verse: @homily.gospel_verse, homily_text: @homily.homily_text, second_reading_book: @homily.second_reading_book, second_reading_chapter: @homily.second_reading_chapter, second_reading_verse: @homily.second_reading_verse, subject: @homily.subject, time: @homily.time, user_id: @homily.user_id, week: @homily.week } }
    end

    assert_redirected_to homily_url(Homily.last)
  end

  test "should show homily" do
    get homily_url(@homily)
    assert_response :success
  end

  test "should get edit" do
    get edit_homily_url(@homily)
    assert_response :success
  end

  test "should update homily" do
    patch homily_url(@homily), params: { homily: { cycle: @homily.cycle, date: @homily.date, first_reading_book: @homily.first_reading_book, first_reading_chapter: @homily.first_reading_chapter, first_reading_verse: @homily.first_reading_verse, gospel_book: @homily.gospel_book, gospel_chapter: @homily.gospel_chapter, gospel_verse: @homily.gospel_verse, homily_text: @homily.homily_text, second_reading_book: @homily.second_reading_book, second_reading_chapter: @homily.second_reading_chapter, second_reading_verse: @homily.second_reading_verse, subject: @homily.subject, time: @homily.time, user_id: @homily.user_id, week: @homily.week } }
    assert_redirected_to homily_url(@homily)
  end

  test "should destroy homily" do
    assert_difference('Homily.count', -1) do
      delete homily_url(@homily)
    end

    assert_redirected_to homilies_url
  end
end
