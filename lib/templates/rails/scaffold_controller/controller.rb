<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  include Responder

  before_action :set_<%= singular_table_name %>, only:  [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET <%= route_url %>
  def index
    @<%= plural_table_name %> = <%= class_name %>.all
  end

  # GET <%= route_url %>/1
  def show
  end

  # GET <%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  # GET <%= route_url %>/1/edit
  def edit
  end

  # POST <%= route_url %>
  def create
    @title = t '<%= plural_table_name %>.new.title'
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>

    create_and_respond
  end

  # PUT/PATCH <%= route_url %>/1
  def update
    @title = t '<%= plural_table_name %>.edit.title'

    update_and_respond
  end

  # DELETE <%= route_url %>/1
  def destroy
    destroy_and_respond
  end

  private

  def set_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  def set_title
    @title = t '.title'
  end

  def <%= singular_table_name %>_params
    params.require(:<%= singular_table_name %>).permit(<%= attributes.map { |a| ":#{a.name}" }.join(', ') %>)
  end
  alias_method :resource_params, :<%= singular_table_name %>_params

  def resource
    @<%= singular_table_name %>
  end
  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_<%= singular_table_name %>_url @<%= singular_table_name %>
  end

  alias_method :after_destroy_url, :<%= index_helper %>_url
end
<% end -%>
