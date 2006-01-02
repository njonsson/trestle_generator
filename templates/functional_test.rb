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
  def test_<%= suffix || 'index' %>
    get :<%= suffix || 'index' %>
    assert_response :success
    assert_template '<%= plural_name %>/_<%= suffix || 'index' %>_without_id'
  end
  
  def test_destroy<%= suffix %>_using_get
    assert_not_nil <%= model_name %>.find(1)
    
    get :destroy<%= suffix %>, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'edit<%= suffix %>'
    
    assert_not_nil <%= model_name %>.find(1)
  end
  
  def test_destroy<%= suffix %>_using_post
    assert_not_nil <%= model_name %>.find(1)
    
    post :destroy<%= suffix %>, :id => 1
    assert_response :redirect
    assert_redirected_to :action => '<%= suffix || 'index' %>'
    
    assert_raise(ActiveRecord::RecordNotFound) { <%= model_name %>.find(1) }
  end
  
  def test_edit<%= suffix %>_using_get
    get :edit<%= suffix %>, :id => 1
    
    assert_response :success
    assert_template 'edit<%= suffix %>'
    
    assert_not_nil assigns(:<%= singular_name %>)
    assert assigns(:<%= singular_name %>).valid?
  end
  
  def test_edit<%= suffix %>_using_post
    post :edit<%= suffix %>, :id => 1
    assert_response :redirect
    assert_redirected_to :action => '<%= suffix || 'index' %>', :id => 1
  end
  
  def test_<%= suffix || 'index' %>_without_id
    get :<%= suffix || 'index' %>
    
    assert_response :success
    assert_template '<%= plural_name %>/_<%= suffix || 'index' %>_without_id'
    
    assert_not_nil assigns(:<%= plural_name %>)
  end
  
  def test_<%= suffix || 'index' %>_with_id
    get :<%= suffix || 'index' %>, :id => 1
    
    assert_response :success
    assert_template '<%= plural_name %>/_<%= suffix || 'index' %>_with_id'
    
    assert_not_nil assigns(:<%= singular_name %>)
    assert assigns(:<%= singular_name %>).valid?
  end
  
  def test_new<%= suffix %>_using_get
    get :new<%= suffix %>
    
    assert_response :success
    assert_template 'new<%= suffix %>'
    
    assert_not_nil assigns(:<%= singular_name %>)
  end
  
  def test_new<%= suffix %>_using_post
    num_<%= plural_name %> = <%= model_name %>.count
    
    post :new<%= suffix %>, :<%= singular_name %> => {}
    
    assert_response :redirect
    assert_redirected_to :action => '<%= suffix || 'index' %>'
    
    assert_equal num_<%= plural_name %> + 1, <%= model_name %>.count
  end
end
