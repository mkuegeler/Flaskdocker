# Start and stop the application (powershell required)
# Use 'down, build, up' to see changes during your development sessions
$opts = $args[0]
# 
$msg = "Call script with either 'up', 'start', 'stop', 'down', 'build'"

# switch parameter input. Sequence: 1.down, 2.build, 3.up
switch ($opts) {    
    up { docker-compose up -d } 
    start { docker-compose start } 
    stop { docker-compose stop } 
    down { docker-compose down -v }
    i { docker images } # shows current images
    c { docker ps -a } # shows current active containers
    # build { docker-compose down -v | docker-compose build --no-cache --pull | docker-compose up -d }
    v { docker volume ls } # shows active volumes
    build { docker-compose build --no-cache --pull }
    clean { docker rmi flaskdocker_web }
    Default {$msg}
}