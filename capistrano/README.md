## Keep capistrano out of rails project.

### Run

```sh
$: yours_capistrano_directory/capistrano/bin/cap staging deploy
```

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

You can see builtin tasks define in project `tasks` directory.

__NOTICE__: those tasks not enabled by default in `cap staging deploy`. 

you need uncomment code in task file for task is auto invoked in special stage.

whenever is builtin support too, you need create your's own `config/schedule.rb` 
to use it.
