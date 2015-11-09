#
# config/initializers/scheduler.rb
require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton

## this is an example, don't uncomment
# s.every '1m' do
#   FormInstanceHelper.close_forms
# end
