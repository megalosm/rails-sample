desc "Copy dispatch and .htaccess for run FastCGI on DreamHost."

task :copy_dispatch_files do
  on roles(:web) do
    execute :cp, "#{deploy_to}/shared/public/dispatch.fcgi #{current_path}/public/dispatch.fcgi"
    execute :cp, "#{deploy_to}/shared/public/.htaccess #{current_path}/public/.htaccess"
  end
end
