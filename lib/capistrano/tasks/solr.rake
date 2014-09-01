namespace :solr do
  desc 'Reindex the documents'
  task reindex: ['deploy:set_rails_env'] do
    on roles(:app) do
      within current_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'subspot:reindex'
        end
      end
    end
  end
end
