# EngageMe
Real-time presentation analytics

##Team Agreements

Work Hour Expectations (186)

General idea: each of us work 62 hours during the next week

General schedule:

  - Thursday:  11am - 7:30pm
  - Friday:    9am - 8pm
  - Saturday:  1pm - 8pm
  - Sunday:    1pm - 8pm
  - Monday:    9am - 8pm
  - Tuesday:   9am - 8pm
  - Wednesday: 9am - 8pm

Each member will have ownership of a part of the design, client, and server
Each member will rotate between scrum, git, and dev ops master role

Technologies used

  - Microsoft Cognitive Services API
  - Rails Back-End
  - React Front-End
  - jQuery for AJAX requests
  - JpegCamera – JavaScript webcam image capture library
  - JavaScript library for data visualization
  - RSpec and Factory Girl (perhaps Capybara)

Who will make the executive decision if there is a disagreement - Tyler

##Workflow

Code and Design Convention
  - Ruby: https://github.com/airbnb/ruby
  - JavaScript: https://github.com/airbnb/javascript

Code review before merging code into master

  - Git master reviews code before merging into master
  - Rebase feature branch before submitting pull requests

Deployment after merging a feature into master

  - Push early and often
  - Not sure if we can push to Heroku - HTTPS needed to run in web browser

Sync ups as needed

  - Every 2 hours during working hours

##Product Vision

Clearly define what is the product at the end of 5 days

  - Create account
  - Start a new presentation and show real-time analytics
  - See analytics of past presentations

One sentence description

Presentation analytics tool that helps presenters capture, monitor and track the audience's emotional reaction to their content in real-time.

User stories

  - User can create an account
  - User can edit their account
  - User can login and logdout
  - User can create a new presentation
  - User can start a new presentation
  - User can monitor the emotional reaction to an in-progress presentation
  - User can view analytics about past presentations

  * User need to be able to connect an external camera

Stretch

  - Users can record presentation audio and compare it to graphs
  - User can get recommendations during an in-progress presentation on how to better engage the audience
  - Sign in with Facebook (potentially add post about the presentation to their timeline)

Tasks

  - Research Devise vs. Bcrypt for authentication (Amanda) - 2 hours
  - Research JavaScript libraries for charts and presentation analytics (Roman) - 2 hours
  - Research connecting external web cam to computer for image capture (Tyler) - 2 hours
  - Research connecting AWS with Heroku for image storage (pre-API call)
  - Implement user authentication (Amanda)
  - Implement graphs and analytics (Roman)
  - Implement camera connection and video capture (Tyler)
  - Implement API calls with images (TBD)
