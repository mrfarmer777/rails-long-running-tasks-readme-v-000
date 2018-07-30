require 'csv'

class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end
  
  def upload #the upload action
    CSV.foreach(params[:leads].path, headers: true) do |lead|   #for each row in the csv file (found with params[leads]path)
      Customer.create(email: lead[0], first_name: lead[1], last_name: lead[2])  #make a new customer object
    end
    redirect_to customers_path
  end

end
