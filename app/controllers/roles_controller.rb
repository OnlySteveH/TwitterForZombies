class RolesController < ApplicationController
  def index
    @roles = Role.includes(:assignments).all
  end

  def new

  end
end