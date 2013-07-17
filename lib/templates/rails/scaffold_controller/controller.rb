<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only:  [:show, :edit, :update, :destroy]
  
  # GET <%= route_url %>
  def index
    @title = t('.title')
    @<%= plural_table_name %> = <%= class_name %>.all
  end

  # GET <%= route_url %>/1
  def show
    @title = t('.title')
  end

  # GET <%= route_url %>/new
  def new
    @title = t('.title')
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  # GET <%= route_url %>/1/edit
  def edit
    @title = t('.title')
  end

  # POST <%= route_url %>
  def create
    @title = t('<%= plural_table_name %>.new.title')
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>

    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to @<%= singular_table_name %>, notice: t('.success') }
        format.json { render action: 'show', status: :created, location: @<%= singular_table_name %> }
      else
        respond_with_error format, 'new'
      end
    end
  end

  # PUT/PATCH <%= route_url %>/1
  def update
    @title = t('<%= plural_table_name %>.edit.title')

    respond_to do |format|
      if @<%= orm_instance.update_attributes("#{singular_table_name}_params") %>
        format.html { redirect_to @<%= singular_table_name %>, notice: t('.success') }
        format.json { head :no_content }
      else
        respond_with_error format, 'edit'
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_<%= singular_table_name %>_url(@<%= singular_table_name %>), alert: t('.stale_object_error')
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= orm_instance.destroy %>
    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  def respond_with_error format, action
    format.html { render action: action }
    format.json { render json: @<%= singular_table_name %>.errors, status: :unprocessable_entity }
  end

  def set_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  def <%= singular_table_name %>_params
    params.require(:<%= singular_table_name %>).permit(<%= attributes.map { |a| ":#{a.name}" }.join(', ') %>)
  end
end
<% end -%>
