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
### For the contact page
- create a messages form, 
- and add a thank you page

### For the home page
- header content; design, dev etc, title, subtitle
- footer content; title
- about me; name, body, socials (no cocoon, simple)
- call to action, in projects

### For the resume page
- downloadable file
- resume; dates, title, company, city_state, description
- education; dates, school, city_state, degree, course
- skills; skill (separate slice_each from mack child)
- languages; name (separate slice_each from mack child)

### For the projects page
- projects; name, body, image

### For the privacy page
- site_setting; privacy policy

### For the terms page
- site_setting; terms info
