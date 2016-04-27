class ContactsController < ApplicationController

	def index
		@contacts = Contact.order("name ASC")
	end

	def new

	end

	def create

		contact = Contact.new(
			:name => params[:contact][:name],
			:address => params[:contact][:address],
			:phone_number => params[:contact][:phone_number],
			:email => params[:contact][:email])

		
		contact.save
		redirect_to("/contacts")
		
	end

	def show
		num = params[:num]
		@contact_at_id = Contact.find_by(id: num)
	end

end
