class BaseController < ApplicationController
  layout :determine_layout
  before_action :authenticate_user!
  before_action :get_user
end
