Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

I- To download a picture for a user :
   1- run :
   rails active_storage:install
   2- add it to your model :
      class User < ApplicationRecord
        has_one_attached :avatar
      end
   3- permit params of devise in application_controller(otherwise it would be on the table controller)
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
   4- For the views: in the registration form(devise/refistrations/new) add a file_field right above the submit button:

    <%= f.label :avatar %>
    <%= f.file_field :avatar %>

   5- To display the avatar in the view :
    <% if current_user.avatar.attached? %>
      <%= image_tag current_user.avatar %>
    <% end %>

  6- Create a bucket on Amazon S3

  7- Create a user on Amazon Iam/ Add a wagon strategy

  8- Add environment variable in .env

  9- Push configuration to Heroku:
  heroku config:set VARIABLE=value123
