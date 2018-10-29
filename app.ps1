# Start and stop the application (powershell required)
# Use 'build' to see changes during your development sessions
$opts = $args[0]
# 
$msg = "Call script with either 'up', 'start', 'stop', 'down', 'build'"

# switch parameter input
switch ($opts) {    
    up { docker-compose up -d } 
    start { docker-compose start } 
    stop { docker-compose stop } 
    down { docker-compose down -v }
    build { docker-compose down -v | docker-compose build --no-cache --pull  | docker-compose up -d }           
    Default {$msg}
}