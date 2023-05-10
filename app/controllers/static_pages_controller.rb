class StaticPagesController < ApplicationController
  def home
  end

  def resume
    @experiences = Experience.order(start_year: :desc)
  end

  def projects
  end

  def contact
    @message = Message.new
  end

  def thankyou
  end

  def privacy
  end

  def terms
  end
end
