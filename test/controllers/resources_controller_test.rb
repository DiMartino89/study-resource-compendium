require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = resources(:one)
	login_as(users(:one))
  end

  test "should get index" do
    get resources_url
    assert_response :success
  end
  
  test "should get resource" do
    get resource_url(@resource)
    assert_response :success
  end

  test "should create resource" do
    assert_difference('Resource.count') do
      post resources_url, params: { category_id: @resource.category_id, description: @resource.description, last_modified: @resource.last_modified, link: @resource.link, name: @resource.name }
    end

    assert_redirected_to resource_path(assigns(:resource))
  end

  test "should get edit" do
    get get edit_resource_url(@resource)
    assert_response :success
  end

  test "should update resource" do
    patch resource_url(@resource), params: { category_id: @resource.category_id, description: @resource.description, last_modified: @resource.last_modified, link: @resource.link, name: @resource.name }
    assert_redirected_to resource_url(@resource)
  end

  test "should destroy resource" do
    assert_difference('Resource.count', -1) do
      delete resource_url(@resource)
    end

    assert_redirected_to resources_url
  end
end
