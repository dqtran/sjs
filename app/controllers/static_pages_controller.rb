class StaticPagesController < ApplicationController

  def home
    @seeking = User.where(seeking: true).first(3)
    @joining = User.where(joining: true).first(3)
    @mentor = User.where(mentor: true).first(3)

    @project = current_user.projects.build if signed_in?
  end

  def resource
  end

  def about
  end

  def contact
  end

end
