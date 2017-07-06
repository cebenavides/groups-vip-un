require 'test_helper'

class GroupImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_image = group_images(:one)
  end

  test "should get index" do
    get group_images_url
    assert_response :success
  end

  test "should get new" do
    get new_group_image_url
    assert_response :success
  end

  test "should create group_image" do
    assert_difference('GroupImage.count') do
      post group_images_url, params: { group_image: {  } }
    end

    assert_redirected_to group_image_url(GroupImage.last)
  end

  test "should show group_image" do
    get group_image_url(@group_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_image_url(@group_image)
    assert_response :success
  end

  test "should update group_image" do
    patch group_image_url(@group_image), params: { group_image: {  } }
    assert_redirected_to group_image_url(@group_image)
  end

  test "should destroy group_image" do
    assert_difference('GroupImage.count', -1) do
      delete group_image_url(@group_image)
    end

    assert_redirected_to group_images_url
  end
end
