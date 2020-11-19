class EmailsController < ApplicationController

  def new
    @emails = Email.all
  end

  def create
    @email = Email.new()
    @email.object = Faker::Color.color_name
    @email.body = Faker::GreekPhilosophers.quote
    
    if @email.save
      flash[:notice] = "Email added"
      respond_to do |format|
      	format.html { redirect_to emails_path}
      	format.js { }
      end
      
    else
    	flash[:notice] = "Please try again"
      respond_to do |format|
      	format.html { redirect_to emails_path}
      	format.js { }
      end
    end
    
  end


end
