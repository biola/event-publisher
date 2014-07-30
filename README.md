event-publisher
======================

Biola's event publisher


[Dependencies](id:Dependencies)
-------------------------------
###### General Dependencies
* **MongoDB** - Mongo greatly increased the performance over Sqlite and MySQL([Documentation](http://mongoid.org/en/mongoid/index.html))
* **Sidekiq** - Anything below version 3.0 ([Documentation](http://sidekiq.org/))
* **Redis** - Must have an external Redis server ([Documentation](http://redis.io/))]
* **Elasticsearch** - Elasticsearch is required by the BUWebContentModels Gem ()

###### Automated Deployment Dependencies (optional)
* **Chef** - Prod/Staging servers must be set with chef. ([Documentation](http://www.getchef.com/chef/))
* **Git** - [Documentation](http://git-scm.com/docs/gittutorial)


[Startup](id:startup)
---------------------
###### First time Setup:
1. Run `bundle`
2. Populate `settings.local.yml`

###### Every time:
1. Run `mongod` to start the Mongo server
2. Then `redis-server` to start redis
3. After that `redis-cli flushall` to empty any old redis tasks
4. Finally, run `sidekiq`
5. And, of course, `rails s`

[Settings](id:settings)
-----------------------
###### General Settings
* The `settings.yml` file is where all the changeable settings are

###### Sensative/Specific Settings
* Sensative and specific settings are located in `settings.local.yml`

[Deployment](id:deployment)
---------------------------
###### Blazing setup
* Create the `config/blazing.rb` file based off of `config/blazing.rb.example`
* Set the proper staging or production locations.
* Set the post deploy file in `lib/tasks/post_deploy.rake`
* For the first time you are pushing to a server run `blazing setup [your_server_here]`

###### Chef setup
* Create a data bag for chef to use in the blazing setup ([Documentation](http://docs.opscode.com/knife_data_bag.html))


###### Subsequent Releases
* `git push [your_server_here] [branch]`
