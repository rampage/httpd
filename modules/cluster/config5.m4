
APACHE_MODPATH_INIT(cluster)

heartbeat_objects='mod_heartbeat.lo'

case "$host" in
  *os2*)
    # OS/2 DLLs must resolve all symbols at build time
    # and we need some from the watchdog module
    heartbeat_objects="$heartbeat_objects ../core/mod_watchdog.la"
    ;;
esac

APACHE_MODULE(heartbeat, Generates Heartbeats, $heartbeat_objects, , most)
APACHE_MODULE(heartmonitor, Collects Heartbeats, , , most)

APACHE_MODPATH_FINISH
