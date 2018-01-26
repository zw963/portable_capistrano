## Keep capistrano out of your's project.

### Run

copy capistrano directory into `yours_capistrano_directory`, and then

```sh
$: yours_capistrano_directory/capistrano/bin/cap staging deploy
```
Or

Add yours_capistrano_directory/capistrano/bin to yours `$PATH`, just run `cap staging deploy`.

remember to remove capistrano's gems from Gemfile.

### Builtin tasks

```sh
╰─ $ ./capistrano/bin/cap -T |grep 'puma\|sidekiq\|whenever\|cable\|ssh_agent_forwarding\|check_write_permissions\|copy_files'
cap cable:add_worker               # Add a worker (TTIN)
cap cable:remove_worker            # Remove a worker (TTOU)
cap cable:restart                  # restart action cable daemon
cap cable:start                    # start action cable daemon
cap cable:status                   # status cable
cap cable:stop                     # stop action cable daemon
cap check_write_permissions        # Check that we can access everything
cap deploy:copy_files              # Copy files
cap puma:add_worker                # Add a worker (TTIN)
cap puma:remove_worker             # Remove a worker (TTOU)
cap puma:restart                   # restart puma daemon
cap puma:start                     # start puma daemon
cap puma:status                    # status puma
cap puma:stop                      # stop puma daemon
cap sidekiq:quiet                  # quiet sidekiq daemon
cap sidekiq:restart                # restart sidekiq daemon
cap sidekiq:start                  # start sidekiq daemon
cap sidekiq:status                 # status sidekiq
cap sidekiq:stop                   # stop sidekiq daemon
cap ssh_agent_forwarding           # Check if agent forwarding is working
cap whenever:clear_crontab         # Clear application's crontab entries using Whenever
cap whenever:update_crontab        # Update application's crontab entries using Whenever

```

You can see above builtin tasks define in this project `capistrano/tasks` directory.

__NOTICE__: those tasks not enabled by default in `cap staging deploy`,you need uncomment code in task file 
for task is auto invoked in special stage.

`whenever` is builtin support too, it will be invoke when deploy if exist `config/schedule.rb` in yours project.

you can run `whenever` command directly too, like following:

```sh
$: yours_capistrano_directory/capistrano/bin/whenever --help
```

### builtin other gems

`capistrano-rails` and `capistrano-rvm` gem is packed.

### Supported platform

Only `linux-x86_64` and `osx` is support.
