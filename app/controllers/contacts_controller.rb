class ContactsController < ApplicationController
	before_action :logged_in_user
	def index
    if params[:category].blank?
		  @contacts = Contact.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @contacts = Contact.where(:category_id => @category_id)
    end  
	end

	def new
		@contact = current_user.contacts.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def edit
		@contact = Contact.find(params[:id])
    @categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def create
		@contact = current_user.contacts.build(contact_params)
    @contact.category_id = params[:category_id]

		if @contact.save
			flash[:success] = "Contact created successfully"
			redirect_to contacts_path
		else
			render 'new'
		end
	end

	def update
		@contact = Contact.find(params[:id])
    @contact.category_id = params[:category_id]
		if @contact.update(contact_params)
			flash[:success] = "Contact Updated Successfully"
			redirect_to contacts_path
		else
			render	'edit'
		end
	end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.delete
    redirect_to contacts_path
  end


	private
		def contact_params
			params.require(:contact).permit(:name, :phone_number, :email, :category_id)
		end
end
