class Client::ContactsController < ApplicationController

  def index
    contact_params = {
      search: params[:search]
    }
    response = Unirest.get("http://localhost:3000/api/contacts", parameters: contact_params)
    @contacts = response.body
    render "index.html.erb"
  end

  def show
    response = Unirest.get("http://localhost:3000/api/contacts/#{params['id']}")
    @contact = response.body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    contact_params = {
      first_name: params["first_name"],
      middle_name: params["middle_name"],
      last_name: params["last_name"],
      city: params["city"],
      email: params["email"],
      cell_phone: params["cell_phone"],
      bio: params["bio"]
    }
    response = Unirest.post("http://localhost:3000/api/contacts", parameters: contact_params).body
    render "create.html.erb"
  end

  def edit
    response = Unirest.get("http://localhost:3000/api/contacts/#{params[:id]}")
    @contact = response.body
    render "edit.html.erb"
  end

def update
    contact_params = {
      first_name: params["first_name"],
      middle_name: params["middle_name"],
      last_name: params["last_name"],
      city: params["city"],
      email: params["email"],
      cell_phone: params["cell_phone"],
      bio: params["bio"]
    }
    response = Unirest.patch("http://localhost:3000/api/contacts/#{params[:id]}", parameters: contact_params).body
    render "update.html.erb"
  end  

  def destroy
    response = Unirest.delete("http://localhost:3000/api/contacts/#{params[:id]}")
    render "destroy.html.erb"
  end 

end
