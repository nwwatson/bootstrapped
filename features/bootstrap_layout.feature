Feature: Bootstrapped Layout Generator
  In order to have a layout
  As a rails developer
  I want to generate a simple layout

  Scenario: Generate normal application layout
    Given a new Rails app
    When I run "rails g bootstrapped:layout -f"
    Then I should see "stylesheet_link_tag "application"" in file "app/views/layouts/application.html.erb"
    And I should see "h(page_title" in file "app/helpers/layout_helper.rb"
    And I should see file "app/helpers/layout_helper.rb"
    And I should see file "app/helpers/error_messages_helper.rb"
    And I should see file "app/views/share/_flash.html.erb"
    
  Scenario: Generate application layout with the name photos
    Given a new Rails app
    When I run "rails g bootstrapped:layout photos -f"
    Then I should see "stylesheet_link_tag "application"" in file "app/views/layouts/photos.html.erb"
    And I should see "h(page_title" in file "app/helpers/layout_helper.rb"
    And I should see file "app/helpers/layout_helper.rb"
    And I should see file "app/helpers/error_messages_helper.rb"
    And I should see file "app/views/share/_flash.html.erb"
    
  Scenario: Generate application layout with fixed layout
    Given a new Rails app
    When I run "rails g bootstrapped:layout application fixed -f"
    Then I should see "stylesheet_link_tag "application"" in file "app/views/layouts/application.html.erb"
    And I should see "h(page_title" in file "app/helpers/layout_helper.rb"
    And I should not see "container-fluid" in file "app/views/layouts/application.html.erb"
    And I should see file "app/helpers/layout_helper.rb"
    And I should see file "app/helpers/error_messages_helper.rb"
    And I should see file "app/views/share/_flash.html.erb"

  Scenario: Generate application layout with fluid layout
    Given a new Rails app
    When I run "rails g bootstrapped:layout application fluid -f"
    Then I should see "stylesheet_link_tag "application"" in file "app/views/layouts/application.html.erb"
    And I should see "h(page_title" in file "app/helpers/layout_helper.rb"
    And I should see "container-fluid" in file "app/views/layouts/application.html.erb"
    And I should see file "app/helpers/layout_helper.rb"
    And I should see file "app/helpers/error_messages_helper.rb"
    And I should see file "app/views/share/_flash.html.erb"