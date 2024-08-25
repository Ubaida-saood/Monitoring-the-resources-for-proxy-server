#!/bin/bash

# Function to display the top 10 applications consuming the most CPU and memory
show_top_apps() {
    echo -e "\nTop 10 Most Used Applications (CPU/Memory):"
    ps aux --sort=-%cpu,-%mem | head -n 11 | awk '{printf "%-10s %-10s %-10s %-10s\n", $1, $2, $3, $4}'
}

# Function to display network monitoring information
show_network_monitoring() {
    echo -e "\nNetwork Monitoring:"
    echo "Concurrent Connections: $(netstat -tun | grep ESTABLISHED | wc -l)"
    echo "Packet Drops: $(netstat -s | grep 'packet receive errors' | awk '{print $1}')"
    echo "Data In/Out (MB):"
    ifstat -i eth0 1 1 | awk '{if(NR==3) print "In: " $6 "MB, Out: " $8 "MB"}'
}

# Function to display disk usage
show_disk_usage() {
    echo -e "\nDisk Usage:"
    df -h | awk 'NR==1 || $5+0 > 80 {print $0}'
}

# Function to display system load and CPU usage
show_system_load() {
    echo -e "\nSystem Load and CPU Usage:"
    uptime
    echo -e "\nCPU Breakdown:"
    mpstat | awk '/all/ {print "User: " $3 "%\nSystem: " $5 "%\nIdle: " $12 "%"}'
}

# Function to display memory usage
show_memory_usage() {
    echo -e "\nMemory Usage:"
    free -h | awk 'NR==1 || NR==2 || NR==3 {print $0}'
    echo -e "\nSwap Usage:"
    free -h | awk 'NR==1 || NR==4 {print $0}'
}

# Function to display process monitoring information
show_process_monitoring() {
    echo -e "\nProcess Monitoring:"
    echo "Active Processes: $(ps aux | wc -l)"
    echo -e "\nTop 5 Processes by CPU and Memory Usage:"
    ps aux --sort=-%cpu,-%mem | head -n 6 | awk '{printf "%-10s %-10s %-10s %-10s\n", $1, $2, $3, $4}'
}

# Function to monitor essential services
show_service_monitoring() {
    echo -e "\nService Monitoring:"
    for service in sshd nginx apache2 iptables; do
        if systemctl is-active --quiet $service; then
            echo "$service: Active"
        else
            echo "$service: Inactive"
        fi
    done
}

# Function to display the full dashboard
show_dashboard() {
    clear
    show_top_apps
    show_network_monitoring
    show_disk_usage
    show_system_load
    show_memory_usage
    show_process_monitoring
    show_service_monitoring
}

# Handle command-line switches
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -top) show_top_apps ;;
        -network) show_network_monitoring ;;
        -disk) show_disk_usage ;;
        -load) show_system_load ;;
        -memory) show_memory_usage ;;
        -process) show_process_monitoring ;;
        -service) show_service_monitoring ;;
        -all) show_dashboard ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Default to showing the full dashboard if no parameters are provided
if [ "$#" -eq 0 ]; then
    while true; do
        show_dashboard
        sleep 5
    done
fi
