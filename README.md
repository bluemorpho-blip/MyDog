# README

##MyDog

####Ruby on Rails application for Flatiron School Rails Portfolio Project  
idea: provides a way to request Rx refills from a local pet clinic.  Users can both sign in  
via Google oauth or sign up directly on the website utilized email/password.  Ouath and  
email/pw are integrated through the session, so users aren't limited to just one way to  
access the site...You can sign in with Google, sign out, and sign back in with your website   
credentials, making life for the user easy.  Once signed in, the user can add their pets' info  
their medications and their choice of contact method - email notification or sms messages.  
Users can click on a request refill link and a prepared email with their info will open in  
the users email client.  They can add additional info if needed.  The admin for the app (admin  
privileges) can access all users, also a simple search form is included.  Once the Rx is ready  
for pickup at the clinic, the admin can click on the user's provided contact method link.  
A prepared dynamic email will send through the admin's email client, or, in the case of the  
chosen contact method being text/sms, a dynamic text message is automatically sent to the  
user's provided phone number.  Easy-peasy.  The pet clinic can check emails for refill requests  
and notify the clients without time on the phone, helping free staff in the clinic for phone  
work.  The more clients the clinic introduces to MyDog, the happier everyone will be...  
I think. . . 


* Ruby version  
ruby 2.7.0p0

* Rails app functional on Linux(Ubuntu 18.04), MacOS and Windows systems.

* Gems:  
omniauth-google-oauth2 for Goolge login  
twilio-ruby for sms text messaging  
figaro for credential security  
bcrypt  

* Database:  
PostgreSQL  
tables:  
users, veterinarians, pets, meds  

* Implemented without Devise or any other db or authentication big gems management  

* Services  
Google for oauth2, developer account required  
Twilio for sms text - developer account required  
free Twilio account available for testing and development  

* Deployment:  
ruby, rails required.  Bundle install, rails s, localhost:3000 for local testing  
DB is PostgreSQL for quick implementation on Heroku.  

* ...I'll add more as I think of it...
