## Cool Lego Minifigures

I would like to collect all [Lego minifigures](http://minifigures.lego.com/en-gb/default.aspx) series and I also like to learn a bit about
[Cucumber](http://cukes.info), so I build this simple app to achieve both goals. 

__How am I going to collect all minifigures?__  
At the early stage of this project, I build a feature to list the minifigures I have collected, so that I will not buy a duplicate.  
And also it allows me to add new minifigures and then shows the update to date list. 

__What does it mean by learning Cucumber in this context?__  
In [Cucumber Book](http://pragprog.com/book/hwcuc/the-cucumber-book), Matt Wynne and Aslak Hellesoy do a great job in explaining these:  
*  Test Rack-based REST APIs in Sinatra  
*  Test Database in sqlite3 and ActiveRecord  
*  Using [Capybara](https://github.com/jnicklas/capybara) to test web application 

With all these knowledge and my huge ambition of collecting all minifigures, so I better put the app on the Cloud and use a NoSQL.   
Eventually, I come with this technology stack:   
*  [webmachine-ruby](https://github.com/seancribbs/webmachine-ruby): An HTTP toolkit for building [Hypermedia API](http://www.designinghypermediaapis.com)  
*  MongoDB  
*  Mongoid  

__Outcome__
It is easy to start collecting and you will be in fully joy of getting new minifigures at the beginning. But it is hard to   
get certain characters as they are rare. However, frustration of collecting, I have a great time of learning Cucumber and building  
my "Cool Lego Minifigures" app.   
Gherkin really helps to describe features, which is so importance for software development, ubiquitous language and crystal clear requirements.   
Using hooks to start MongoDB server, clean database, conduct code coverage are handy.   
Most important, once I have my feature defined, I can focus on development as I know I am doing the right thing. After that, I can conduct refactoring without fear.    

