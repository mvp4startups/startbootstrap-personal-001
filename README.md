# STEPS

## Gems Versions
- Ruby version: 3.0.4
- Rails version: 7.0.4.3
- Gems versions: 
```

```

## Download template
- you need to create a free account at: https://startbootstrap.com/
- https://startbootstrap.com/theme/personal

## Create new app
- in terminal: rails new startbootstrap-personal-001
- cd into the new app: cd startbootstrap-personal-001
- create a folder: 
```
mkdir _template
```
- copy the downloaded template to this folder
- in terminal type: subl . (or the symlink to your editor)
- google: how to create a symlink for sublime (or your editor)
- https://gist.github.com/vanderlin/ae02bf5ee6a43c5531d9
- in terminal type: rails s 
- in your browser go to: http://localhost:3000/ 
- (we should see the Rails homepage)

## Create the static pages
- in terminal: rails g controller StaticPages home resume projects contact
- update the routes file
```
  root "static_pages#home"
  get 'resume', to: 'static_pages#resume'
  get 'projects', to: 'static_pages#projects'
  get 'contact', to: 'static_pages#contact'
```
- add a basic navbar to the layouts/application
```
// app/views/layouts/application.html.erb
  <body>
    <nav>
      <ul>
        <li><%= link_to 'Home', root_path %></li>
        <li><%= link_to 'Resume', resume_path %></li>
        <li><%= link_to 'Projects', projects_path %></li>
        <li><%= link_to 'Contact', contact_path %></li>
      </ul>
    </nav>
    <%= yield %>
  </body>
```
- refresh the browser and test the links make sure they work

## Add the html
- copy the images from the template/assets/ to: app/assets/images
- copy the html from the head tag to the layouts/application.html.erb file
```
***set page_defaults from hudgens dissecting tutorial
set favicon link
```

- copy the body from index.html and paste on the layout/app file
- refresh the home page
- create the shared folder
- create the nav partial
- create the brand link block
```
    <%= link_to root_path, class: 'navbar-brand' do %>
      <span class="fw-bolder text-primary">Start Bootstrap</span>
    <% end %>
```
- add the render to the layouts/app
- refresh and test out the links
- create the footer partial
- make the links rails links
- add the render to the layout app
- copy the header and section and paste to the home.html.erb
- update the image with an image tag
- go through all the href tags and make the correct links
- move the yield in the layout app
- copy the resume html to the resume file
- copy the projects html to the projects file
- update the 'contact me' link
- copy the contact html to the contact file
- refresh and test the links; go to each page and make sure everything is ok

## Add the css
- copy the css/styles.css file and paste in assets/stylesheets
- refresh the page and check all the links
- make sure each page looks right

## Add the js, basic not stimulus
- make the browser small like phone view
- test the menu, since no javascript, its not working
- copy the bootstrap js from the bottom of the index file
- paste in the head section of the layout/app file
- refresh the page and test the menu
- it should work
- open the developer tools and make sure there are no errors in the console section

## Creating static pages by hand
- go to: http://localhost:3000/privacy
- should get error
- update routes
```
get 'privacy', to: 'static_pages#privacy'
```
- refresh page: error 'no action'
- update static pages controller
```
  def privacy
  end
```

- refresh page: error 'missing template'
- create the file static_pages/privacy.html.erb
- copy the styling from projects
- final code in gituhub
- refresh the page
- follow the steps for the 'terms' page
- update the links in the footer file
- update the copyright with the dynamic year
```
<div class="small m-0">
        Copyright &copy; Personal <%= Time.now.year %>
        </div>
```

## Add the dynamic content
### For the projects page
- projects; name, body, image
- rails g scaffold Project name body:text
- rails active_storage:install
- rails db:migrate
- add gem: gem 'active_storage_validations'
- stop the server
- in terminal: bundle
- restart the server
- add image to model
- add validations to model
```

class Project < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3}
  validates :body, length: { minimum: 1, maximum: 280 }
  has_one_attached :image

  validates :image, attached: true, 
                    content_type: [:png, :jpg, :jpeg]

end
```
- update the projects controller params
```
    def project_params
      params.require(:project).permit(:name, :body, :image)
    end
```
- update the form like the contact form styles
- update projects/new and edit files
- update the projects/index
- update the projects/project partial
- update the routes
```
  resources :projects, except: :show
  # get 'projects', to: 'static_pages#projects'
```
- update the projects controller index action
```
  def index
    @projects = Project.order(created_at: :desc)
  end
```
- update the projects controller create action
```
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_url, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
```
- go to projects/new and create a project with an image
- test the validations

### For the contact page
- create a messages form, 
- rails g scaffold Message full_name email phone body:text
- rails db:migrate
- add validations
```
class Message < ApplicationRecord
  validates :full_name, presence: true, length: {minimum: 3}
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }  
  validates :phone, presence: true
  validates :body, length: { minimum: 1, maximum: 280 }
end
```
- update the contact.html.erb with the form partial
- update the messages/form partial with the bootstrap classes
- update the static pages controller contact action
```
  def contact
    @message = Message.new
  end
```
- update the messages controller create action
```
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html {redirect_to thankyou_path }
        # format.html { redirect_to message_url(@message), notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render 'static_pages/contact', status: :unprocessable_entity }
        # format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
```
- adding a thank you page
- update the routes file
```
get 'thankyou', to: 'static_pages#thankyou'
```
- create the static_pages/thankyou.html.erb file
- refresh the contact page, and send a message
- to see the messages go to:
```
http://localhost:3000/messages
```
- update the messages/index with a table
- update the messages controller index action
```
  def index
    @messages = Message.order(created_at: :desc)
  end
```
- update the links with mail_to and link to show page
- update the show page with a card for the message 
- add mail_to and tel links

### For the resume page
- resume; 
- experience start_year, end_year, title, company, city_state, description
- rails g scaffold Experience start_year:integer end_year:integer title company city_state description:text
- update the resume page, the experiences section
- update the experiences/experience partial
- update the static pages controller, resume action
```
  def resume
    @experiences = Experience.order(start_year: :desc)
  end
```
- add validations
- downloadable file
- education; dates, school, city_state, degree, course
- skills; skill (separate slice_each from mack child)
- languages; name (separate slice_each from mack child)

### For the home page
- header content; design, dev etc, title, subtitle
- footer content; title
- about me; name, body, socials (no cocoon, simple)
- call to action, in projects

### For the privacy page
- site_setting; privacy policy

### For the terms page
- site_setting; terms info
