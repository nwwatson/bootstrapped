Feature: Bootstrapped Installation Generator
  In order to install Bootstrapped
  As a rails developer
  I want to install Bootstrapped
  
  Scenario: Generate Installation with LESS CSS support
    Given a new Rails app
    When I run "rails g bootstrapped:install"
    Then I should see the following files
      | app/assets/javascripts/application.js                       |
      | app/assets/stylesheets/application.css                      |
      | app/assets/javascripts/bootstrap.js.coffee                  |
      | app/assets/stylesheets/bootstrap_and_overrides.css.less     |
    And I should see "//= require bootstrap" in file "app/assets/javascripts/application.js"
    And I should not see "*= require twitter/bootstrap/static/bootstrap" in file "app/assets/stylesheets/application.css"
        
  Scenario: Generate Installation with Static CSS Files
    Given a new Rails app
    When I run "rails g bootstrapped:install static"
    Then I should see the following files
      | app/assets/javascripts/application.js                       |
      | app/assets/stylesheets/application.css                      |
    And I should see "//= require bootstrap" in file "app/assets/javascripts/application.js"
    And I should see "*= require twitter/bootstrap/static/bootstrap" in file "app/assets/stylesheets/application.css"
    And I should not see "*= bootstrap_and_overrides" in file "app/assets/stylesheets/application.css"

