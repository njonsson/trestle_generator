class <%= controller_class_name %>Controller < ApplicationController
  verify :only => [ :edit, :destroy ],
         :params => :id,
         :add_flash => { :notice => 'Missing <%= model_name %> ID.' },
         :redirect_to => { :action => 'index<%= suffix %>' }
  verify :only => :destroy,
         :method => :post,
         :add_flash => { :notice => '<%= model_name %> can be destroyed only by using HTTP POST.' },
         :redirect_to => { :action => 'index<%= suffix %>' }
  
<% for action in untrestled_actions -%>
  def <%= action %><%= suffix %>
  end
  
<% end -%>
  def add_new<%= suffix %>
    if request.post?
      @<%= singular_name %> = <%= model_name %>.new(params[:<%= singular_name %>])
      if @<%= singular_name %>.save
        flash[:notice] = 'A new <%= model_name %> was successfully added.'
        redirect_to :action => 'index<%= suffix %>'
      end
    else
      @<%= singular_name %> = <%= model_name %>.new
    end
  end
  
  def destroy<%= suffix %>
    <%= model_name %>.find(params[:id]).destroy
    flash[:notice] = '<%= model_name %> was successfully destroyed.'
    redirect_to :action => 'index<%= suffix %>'
  end
  
  def edit<%= suffix %>
    if request.post?
      @<%= singular_name %> = <%= model_name %>.find(params[:id])
      if @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])
        flash[:notice] = '<%= model_name %> was successfully edited.'
        redirect_to :action => 'index<%= suffix %>', :id => @<%= singular_name %>
      end
    else
      @<%= singular_name %> = <%= model_name %>.find(params[:id])
    end
  end
  
<% unless suffix -%>
  def index
    if params[:id]
      @<%= singular_name %> = <%= model_name %>.find(params[:id])
      render '<%= plural_name %>/_index<%= suffix %>_with_id'
    else
      @<%= singular_name %>_pages, @<%= plural_name %> = paginate(:<%= plural_name %>)
      render '<%= plural_name %>/_index<%= suffix %>_without_id'
    end
  end
<% end -%>
end
