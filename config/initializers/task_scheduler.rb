require 'rubygems'
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.start_new

#scheduler.every("1m") do
   #UserMailer.cron_send_email.deliver
   #puts "cron job ok"
#end

scheduler.cron '0 16 * * 1-5 Asia/Bangkok' do
  # every day of the week at 14:00 (4pm)
  UserMailer.cron_send_email.deliver
end 