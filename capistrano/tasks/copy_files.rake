namespace :deploy do
  desc 'Copy files'
  task :copy_files do
    next unless any? :copy_files
    on roles :app do
      last_release = capture(:ls, '-xr', releases_path).split.fetch(1, nil)
      next unless last_release
      last_release_path = releases_path.join(last_release)

      fetch(:copy_files).each do |path|
        source = last_release_path.join(path)
        target = release_path.join(path)

        if test "[ -f #{source} ]"
          execute :cp, '', source, target
        elsif test "[ -d #{source} ]"
          execute :cp, '-R', source, target
        else
          warn "#{source} is not a file/dir that can be copied (target: #{target})"
        end
      end
    end
  end
end
