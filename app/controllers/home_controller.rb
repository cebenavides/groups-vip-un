class HomeController < ApplicationController
  def index
  	@groups = Group.where(visible: true)
  end
end