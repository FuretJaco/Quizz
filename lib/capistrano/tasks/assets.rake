namespace :deploy do

  namespace :assets do

    # Clear existing task so we can replace it rather than "add" to it.
    Rake::Task['deploy:assets:precompile'].clear_actions

    desc "Precompile assets locally and then rsync to web servers"
    task :precompile do

      # compile assets locally
      run_locally do
        execute "bundle exec rake assets:precompile"
      end

      # rsync to each server
      local_dir = "./public/assets/"

      on roles( fetch(:assets_roles, [:web]) ) do
        old_manifest_path = "#{release_path}/public/assets/manifest*"
        execute :rm, old_manifest_path if test "[ -f #{old_manifest_path} ]"
        [ ".sprockets-manifest*", "manifest*.*"].each do |pattern|
          candidate = release_path.join('public', fetch(:assets_prefix), pattern)
          execute :rm, candidate if test "[ -f #{candidate} ]"
        end

        upload!(local_dir, "#{release_path}/public/", recursive: true)
      end

      # clean up
      run_locally { execute "rm -rf #{local_dir}" }
    end

  end


end

