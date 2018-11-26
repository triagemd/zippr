require 'test_helper'

class ExtractionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get extractions_show_url
    assert_response :success
  end

  test 'should return 422 when no url given' do
    get extractions_show_url, params: {filename: 'zomg'}
    assert_response :unprocessable_entity
    assert json_response.dig('url').present?
  end

  test 'should return 422 when no filename given' do
    get extractions_show_url, params: {url: 'http://example.com/test'}
    assert_response :unprocessable_entity
    puts json_response
    assert json_response.dig('filename').present?
  end
end
