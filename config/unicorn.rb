# Set the working application directory
# working_directory "/path/to/your/app"
@directory = "/var/www/echesters"

working_directory @directory

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "#{@directory}/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/logs/unicorn.log"
# stdout_path "/path/to/logs/unicorn.log"
stderr_path "#{@directory}/logs/unicorn.log"
stdout_path "#{@directory}/logs/unicorn.log"

# Unicorn socket
# listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.echesters.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30