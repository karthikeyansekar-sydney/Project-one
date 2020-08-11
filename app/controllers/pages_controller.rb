class PagesController < ApplicationController
  before_action :check_if_logged_in, only: [ :home ]

 def welcome
   # raise 'hell'
 end

 def home
   # logged-in users only from here on!
   # ...
 end
end
