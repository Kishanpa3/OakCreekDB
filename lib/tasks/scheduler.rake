# if [ "$(date +%u)" = 7 ]; then rake clear_cache; fi   # only run on Sundays
desc "This task is called by the Heroku scheduler add-on"
task :clear_cache => :environment do
  # S3 storage 
  s3 = Shrine.storages[:cache]
  s3.clear! { |object| object.last_modified < Time.now - 7*24*60*60 } # delete files older than 1 week 
end

task :clear_unconfirmed_users => :environment do
  users = User.where("approved = ? AND confirmed_at IS NOT NULL", false)
  users.destroy_all! { |object| object.last_modified < Time.now - 3*7*24*60*60 } unless users.nil? # delete unconfirmed users older than 3 weeks 
end