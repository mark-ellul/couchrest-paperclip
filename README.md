
CouchRest::Paperclip - Making Paperclip play nice with CouchDB via CouchRest::Model
================================================================

This Readme and project is a Copy of `Mongoid::Paperclip` but it works for CouchDb using CouchRest_Model
Original GEM: https://github.com/meskyanichi/mongoid-paperclip

As the title suggests: `CouchRest::Paperclip` makes it easy to hook up [Paperclip](https://github.com/thoughtbot/paperclip) with [Mongoid](http://mongoid.org/).

This is actually easier and faster to set up than when using Paperclip and the ActiveRecord ORM.
This example assumes you are using **Ruby on Rails 3** and **Bundler**. However it doesn't require either.

** Please Note I have only tested this using Amazon S3 **

Setting it up
-------------

Simply define the `couchrest-paperclip` gem inside your `Gemfile`. Additionally, you can define the `aws-s3` gem if you want to upload your files to Amazon S3. *You do not need to explicitly define the `paperclip` gem itself, since this is handled by `couchrest-paperclip`.*

**Rails.root/Gemfile - Just define the following:**

    gem "couchrest-paperclip", :require => "couchrest_paperclip"
    gem "aws-s3",            :require => "aws/s3"
    
Next let's assume we have a User model and we want to allow our users to upload an avatar.

**Rails.root/app/models/user.rb - include the CouchRest::Paperclip module and invoke the provided class method**

    class User < CouchRest::Model::Base
      include CouchRest::Paperclip
      
      has_attached_file :avatar,
        :storage => :s3,
        :s3_credentials => "#{Rails.root}/config/s3.yml",
        :path => ":class/:attachment/:id/:style/:filename"

      
    end


That's it
--------

That's all you have to do. Users can now upload avatars. Unlike ActiveRecord, Mongoid doesn't use migrations, so we don't need to define the Paperclip columns in a separate file. Invoking the `has_attached_file` method will automatically define the necessary `:avatar` fields for you in the background.
