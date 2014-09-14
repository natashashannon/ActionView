ActionView
==========

Brief intro to ActionView. Project documentation can be found at at www.natashashannon.com/actionview.html and the code is included below. Please view this file in raw view to see the code as the view is converting the HTML in this document.

==========
$ rails new supplies

$ cd /supplies

$ rails g scaffold Food name expiration_date:date qty:integer description

$ rake db:migrate

$ rails s  
# This launches the rails server. CTRL C exits the server.

go to http://localhost:3000/foods
# Add a few foods! 

--- Step 1. Add a navigation heading “List of all Foods” ---
go to /supplies/app/views/layouts/application.html.erb
 inside the body tag add:

<h3><strong><a href="/foods">List of all Foods</a></strong></h3>

--- Step 2. Edit the view, create a search form ---
go to /supplies/app/views/foods/index.html.erb file
below the <h1> heading add:

<%= form_tag(dogs_path, :method => "get", id: "search-form") do %>
  <%= text_field_tag :search, params[:search], placeholder: "Search Users" %>
  <%= submit_tag "Search", :name => nil %>
<% end %>

--- Step 3. Edit the controller, define the index parameters ---
go to /supplies/app/controllers/foods_controller.rb

replace
  def index
    @foods = Food.all
  end

with
  def index
    if params[:search]
      @foods = Food.search(params[:search]).order("name ASC")
      else
      @foods = Food.all.order("name ASC")
    end
  end

--- Step 4. Edit the model, define search query and include name validation of model records.  ---
go to model /supplies/app/models/food.rb
replace the default text with the text below

  class Food < ActiveRecord::Base
  validate :name_included

  def name_included
    validates_presence_of :name
     end
    end
  
    def self.search(query)
      where("name like ?", "%#{query}%") 
    end

---  Step 5. Edit the form, to change default date_select date range ---
go to /supplies/app/views/foods/_form.html.erb file

change
   <%= f.date_select :expiration_date %>
to
    <%= f.date_select(:expiration_date,:start_year => 2014, end_year: 2030) %>

--- Add a few more foods and you're DONE! ---
