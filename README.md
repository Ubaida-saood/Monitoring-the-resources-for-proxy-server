# Monitoring-the-resources-for-proxy-server
This Bash script provides a real-time monitoring dashboard for a proxy server, covering system resources such as CPU, memory, disk usage, network activity, and active processes. The script also allows monitoring of essential services like sshd, nginx/apache, and iptables.

# Features
Top 10 Most Used Applications: Displays the top 10 applications consuming the most CPU and memory.
Network Monitoring: Provides details on concurrent connections, packet drops, and data transfer (MB in/out).
Disk Usage: Shows disk space usage by mounted partitions and highlights partitions using more than 80% of the space.
System Load: Displays the current load average and a breakdown of CPU usage (user, system, idle, etc.).
Memory Usage: Displays total, used, and free memory, along with swap memory usage.
Process Monitoring: Shows the number of active processes and the top 5 processes in terms of CPU and memory usage.
Service Monitoring: Monitors the status of essential services like sshd, nginx/apache, and iptables.
Custom Dashboard: Command-line switches allow you to view specific sections of the dashboard.

# Requirements
1) Bash: The script is written in Bash and should be executed in a Bash-compatible shell.
2) Utilities: The script uses common Linux utilities such as ps, netstat, ifstat, df, uptime, mpstat, and systemctl. Ensure these are installed on your system.

# Installation
1) Download or clone the script to your local machine.
2) Make the script executable:
  ```chmod +x monitor_dashboard.sh```
3) Run the script with appropriate command-line switches or to view the full dashboard.

# Usage
## Running the Full Dashboard
To view the entire monitoring dashboard with real-time updates:
```./monitor_dashboard.sh```
The dashboard will refresh every 5 seconds, providing live updates of the system's status.

# Viewing Specific Sections

You can view specific sections of the dashboard using command-line switches:

------>Top 10 Most Used Applications:
```./monitor_dashboard.sh -top```

------>Network Monitoring:
```./monitor_dashboard.sh -network```

------>Disk Usage:
```./monitor_dashboard.sh -disk```

------>System Load:
```./monitor_dashboard.sh -load```

------>Memory Usage:
```./monitor_dashboard.sh -memory```

------>Process Monitoring:
```./monitor_dashboard.sh -process```



# Efficiency and Performance

1) Real-time Updates: The script refreshes data every 5 seconds when running the full dashboard. You can adjust this interval by modifying the sleep duration in the script.
2) Efficient Commands: The script uses efficient Linux commands like ps, df, and mpstat, which are optimized for performance.
3) Customization: Command-line switches allow for running only specific parts of the dashboard, reducing unnecessary resource usage.


# Conclusion

The monitor_dashboard.sh script is a comprehensive tool for monitoring various system resources on a proxy server. It is efficient, customizable, and easy to use, making it suitable for system administrators and developers who need real-time insights into server performance.
