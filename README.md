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

```
## Add the css
## Add the js, basic not stimulus
## Add the dynamic content
