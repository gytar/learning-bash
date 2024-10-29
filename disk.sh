#!/usr/bin/env bash

server_name=$(hostname)
# current memory usage
# echo "current disk usage : $(df -h | grep 'nvme0n1p2' | awk '{print $4 " (" $3 "/" $2 ")"}')"
function memory_usage() {
    echo ""
    echo "The current memory usage on ${server_name} is:"
    free -h
    echo ""
}

function disk_usage() {
    echo "The current disk usage on $server_name is:"
    df -h
    echo ""
}

function cpu_usage() {
    echo "The current cpu usage on ${server_name} is:"
    uptime
    echo ""
}

function kernel_check() {
    echo "Kernel version on ${server_name} : $(uname -r)"
}

function tcp_check() {
    echo "TCP connexion on ${server_name}:"
    cat /proc/net/tcp
    echo ""
}

function all_checks() {
    memory_usage
    disk_usage
    cpu_usage
    kernel_check
    tcp_check
}

# colors
green_color='\e[32m'
blue_color='\e[34m'
clear_color='\e[0m'
red_color='\e[31m'
# color functions
function color_green() {
    text=$1
    echo -ne "$green_color$text$clear_color"
}

function color_blue() {
    text=$1
    echo -ne "$blue_color$text$clear_color"
}

function menu() {
    echo -ne "
    $(color_green '1)') Memory usage 
    $(color_green '2)') CPU Load 
    $(color_green '3)') Number of TCP connections
    $(color_green '4)') Kernel version
    $(color_green '5)') Check all
    $(color_green '0)') Exit
    $(color_blue 'Choose option: ')"
    read -r option
    case $option in
        1) memory_usage ; menu ;;
        2) cpu_usage ; menu ;;
        3) tcp_check ; menu ;;
        4) kernel_check ; menu ;;
        5) all_checks ; menu ;;
        0) exit 0 ;;
        *) echo -e "${red_color}Wrong option.${clear_color}"; menu ;; 
    esac
}
menu

