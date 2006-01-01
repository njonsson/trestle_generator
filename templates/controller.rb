class <%= controller_class_name %>Controller < ApplicationController
  verify :only => [ :edit<%= suffix %>, :destroy<%= suffix %> ],
         :params => :id,
         :add_flash => { :notice => 'Missing <%= singular_name %> ID.' },
         :redirect_to => { :action => '<%= suffix || 'index' %>' }
  
<% for action in untrestled_actions -%>
  def <%= action %><%= suffix %>
  end
  
<% end -%>
  def add_new<%= suffix %>
    if request.post?
      @<%= singular_name %> = <%= model_name %>.new(params[:<%= singular_name %>])
      if @<%= singular_name %>.save
        flash[:notice] = 'A new <%= singular_name %> was successfully added.'
        redirect_to :action => '<%= suffix || 'index' %>'
      end
    else
      @<%= singular_name %> = <%= model_name %>.new
    end
  end
  
  def destroy<%= suffix %>
    if request.post?
      <%= model_name %>.find(params[:id]).destroy
      flash[:notice] = 'The <%= singular_name %> was successfully destroyed.'
      redirect_to :action => '<%= suffix || 'index' %>'
    else
      flash[:notice] = 'Click Destroy to destroy the <%= model_name %>.'
      redirect_to :action => 'edit<%= suffix %>', :id => params[:id]
    end
  end
  
  def edit<%= suffix %>
    if request.post?
      @<%= singular_name %> = <%= model_name %>.find(params[:id])
      if @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])
        flash[:notice] = 'The <%= singular_name %> was successfully edited.'
        redirect_to :action => '<%= suffix || 'index' %>', :id => @<%= singular_name %>
      end
    else
      @<%= singular_name %> = <%= model_name %>.find(params[:id])
    end
  end
  
  def <%= suffix || 'index' %>
    if params[:id]
      @<%= singular_name %> = <%= model_name %>.find(params[:id])
      render '<%= plural_name %>/_<%= suffix || 'index' %>_with_id'
    else
      @<%= singular_name %>_pages, @<%= plural_name %> = paginate(:<%= plural_name %>)
      render '<%= plural_name %>/_<%= suffix || 'index' %>_without_id'
    end
  end
end
