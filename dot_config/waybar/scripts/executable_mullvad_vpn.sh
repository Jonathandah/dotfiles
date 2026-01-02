#!/bin/bash

# Mullvad CLI
vpn_get_status() {
  mullvad status
}
vpn_reconnect() {
  mullvad reconnect
}
vpn_disconnect() {
  mullvad disconnect
}
vpn_connect() {
  mullvad connect
}
vpn_help() {
  mullvad
}

#Parsers
parse_status() {
  local status="$1"
  VPN_CONNECTION=$(echo "$status" | head -n1 | xargs)
  VPN_RELAY=$(echo "$status" | awk -F'Relay: ' '/Relay:/ {print $2}' | xargs)
  VPN_FEATURES=$(echo "$status" | awk -F'Features: ' '/Features:/ {print $2}' | xargs)
  VPN_VISIBLE_LOCATION=$(echo "$status" | awk -F'Visible location: ' '/Visible location:/ {print $2}' | xargs)
}

#Methods
toggle_connection() {
  if [ "$VPN_CONNECTION" = "Connected" ]; then
    vpn_disconnect
  else
    vpn_connect
  fi

  notify-send
  sleep 1
}

reconnect() {
  vpn_reconnect

  notify-send
  sleep 1
}

get_status() {
  local class alt tooltip

  tooltip="Mullvad VPN\n\nStatus: $VPN_CONNECTION\nRelay: $VPN_RELAY\nFeatures: $VPN_FEATURES\nVisible Location: $VPN_VISIBLE_LOCATION"

  case "$VPN_CONNECTION" in
  Connected)
    class="connected"
    alt="connected"
    ;;
  Connecting)
    class="connecting"
    alt="connecting"
    ;;
  *)
    class="disconnected"
    alt="disconnected"
    ;;
  esac

  echo "{\"text\": \"$VPN_CONNECTION\", \"tooltip\": \"$tooltip\", \"alt\": \"$alt\", \"class\": \"$class\"}"
}

# Init
parse_status "$(vpn_get_status)"

#Args
case "$1" in
toggle) toggle_connection ;;
reconnect) reconnect ;;
status) get_status ;;
*) vpn_help ;;
esac
