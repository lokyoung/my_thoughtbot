class ShoutsController < ApplicationController

  def show
    @shout = Shout.find(prams[:id])
  end
  
end
