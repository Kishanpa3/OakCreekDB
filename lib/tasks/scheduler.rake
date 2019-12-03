desc "This task is called by the Heroku scheduler add-on"
task :clear_cache => :environment do
  # S3 storage 
  s3 = Shrine.storages[:cache]
  s3.clear! { |object| object.last_modified < Time.now - 7*24*60*60 } # delete files older than 1 week 
end