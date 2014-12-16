$TTL    604800
@       IN      SOA     util01-priv.catnameddog.com. stonerc.gmail.com. (
                       20141215         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
       IN      NS      util01-priv.catnameddog.com.

util01-priv.catnameddog.com.       IN       A      172.31.2.191
www01.catnameddog.com.             IN       A      172.31.0.208 
