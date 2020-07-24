# Rate That Agent

Rate that agent is a web app built for rental tenants by rental tenants. The app is designed to allow tenants to post reviews on real estate agents or landlords to give an insight on their experience renting from them.

View app at: https://cryptic-hollows-95726.herokuapp.com/

## App Features:

- Create an account
- Login and Logout
- Post reviews
- Update or Delete a review (only allowed if it is the owner of the post)

## Technologies:

- Built using Ruby with Sinatra framework
- PostgresSQL
- BCrypt

## Process:

When creating this app, I first started writing wireframes to create a map of how this was to be compelted and what I wanted to accomplish with this app.

I looked at what tables would be required for the database (see below) and what features I wanted for the app.

Then I looked at how I wanted to map the paths of the app and mocking up how each page would look.

Before getting down to code, I created a Trello board (https://trello.com/b/SkqYw51n/project-2) to help organise my process and to keep track of the minor things to do as well as the major parts of the app.

Tables created with SQL:
- Users
- Houses

## Challenges:

The main challenges I had was to do with broken paths and syntax errors. Using the errors, I was able to fix my issues and navigate more cleanly through the paths. 

## Incompleted:

- Ability to delete account
- A rating system out of 5 stars
- The homepage to include the latest posts with a link to 'more'
  - As well as highlighted suburbs with a link to more in that suburb
- Horiztonal gallery of the posts, with multiple galleries
- Search function
- Upload lease to confirm living at the rental
- Posts would need to be verified, especially if it's a really bad review
- Landlords ability to request removal of the review if they a new owners of the property
- Pros & cons section for the review
- Feedback page on the app