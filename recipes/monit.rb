include_recipe 'monit'

if node['recipes'].include?('celery::worker') or node['recipes'].include?('celery::celeryd')
  monitrc 'celeryd' do
    source 'monit-celeryd.conf.erb'
    cookbook 'celery'
  end
end

if node['recipes'].include?('celery::scheduler') or node['recipes'].include?('celery::celerybeat')
  monitrc 'celerybeat' do
    source 'monit-celerybeat.conf.erb'
    cookbook 'celery'
  end
end