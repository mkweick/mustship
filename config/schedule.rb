set :environment, "development"
set :output, { :error => "log/cron_error_log.log",
               :standard => "log/cron_log.log" }

every '*/3 5-20 * * 1-5' do
  rake "mustship:update"
end

every '*/3 5-12 * * 6' do
  rake "mustship:update"
end
