rails g model posts title:string body:text
rails g controller post


rails g controller comments --skip-template-engine	
rails g model comments body:text post:references