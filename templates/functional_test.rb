require File.dirname(__FILE__) + '<%= "/.." * controller_class_nesting_depth %>/../test_helper'
require '<%= controller_file_path %>_controller'

# Re-raise errors caught by the controller.
class <%= controller_class_name %>Controller; def rescue_action(e) raise e end; end

class <%= controller_class_name %>ControllerTest < Test::Unit::TestCase
  fixtures :<%= table_name %>
  
  def setup
    @controller = <%= controller_class_name %>Controller.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
  
<% for action in untrestled_actions -%>
  def test_<%= action %>
    get :<%= action %>
    assert_response :success
    assert_template '<%= action %>'
  end
  
<% end -%>
<% unless suffix -%>
  def test_index
    get :index
    assert_response :success
    assert_template '<%= plural_name %>/_index<%= suffix %>_without_id'
  end
  
<% end -%>
  def test_add_new<%= suffix %>_get
    get :add_new<%= suffix %>
    
    assert_response :success
    assert_template 'add_new<%= suffix %>'
    
    assert_not_nil assigns(:<%= singular_name %>)
  end
  
  def test_add_new<%= suffix %>_post
    num_<%= plural_name %> = <%= model_name %>.count
    
    post :add_new<%= suffix %>, :<%= singular_name %> => {}
    
    assert_response :redirect
    assert_redirected_to :action => 'index<%= suffix %>'
    
    assert_equal num_<%= plural_name %> + 1, <%= model_name %>.count
  end
  
  def test_destroy<%= suffix %>_get
    assert_not_nil <%= model_name %>.find(1)
    
    get :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'edit<%= suffix %>'
    
    assert_not_nil <%= model_name %>.find(1)
  end
  
  def test_destroy<%= suffix %>_post
    assert_not_nil <%= model_name %>.find(1)
    
    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'index<%= suffix %>'
    
    assert_raise(ActiveRecord::RecordNotFound) { <%= model_name %>.find(1) }
  end
  
  def test_edit<%= suffix %>_get
    get :edit<%= suffix %>, :id => 1
    
    assert_response :success
    assert_template 'edit<%= suffix %>'
    
    assert_not_nil assigns(:<%= singular_name %>)
    assert assigns(:<%= singular_name %>).valid?
  end
  
  def test_edit<%= suffix %>_post
    post :edit<%= suffix %>, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'index<%= suffix %>', :id => 1
  end
  
  def test_index<%= suffix %>_without_id
    get :index<%= suffix %>
    
    assert_response :success
    assert_template '<%= plural_name %>/_index<%= suffix %>_without_id'
    
    assert_not_nil assigns(:<%= plural_name %>)
  end
  
  def test_index<%= suffix %>_with_id
    get :index<%= suffix %>, :id => 1
    
    assert_response :success
    assert_template '<%= plural_name %>/_index<%= suffix %>_with_id'
    
    assert_not_nil assigns(:<%= singular_name %>)
    assert assigns(:<%= singular_name %>).valid?
  end
end
