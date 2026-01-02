#!/bin/bash
# Get Mullvad VPN status
VPN_STATUS=$(mullvad status)
VPN_CONNECTION=$(echo "$VPN_STATUS" | cut -d' ' -f3)
VPN_RELAY=$(echo "$VPN_STATUS" | grep -i "Relay:" | cut -d':' -f2 | xargs)
VPN_FEATURES=$(echo "$VPN_STATUS" | grep -i "Features:" | cut -d':' -f2 | xargs)
VPN_VISIBLE_LOCATION=$(echo "$VPN_STATUS" | grep -i "Visible location:" | cut -d':' -f2 | xargs)

# Statuses
STATUS_CONNECTED=Connected
STATUS_CONNECTING=Connecting

# Vars
TOOLTIP="Mullvad VPN \n\nStatus: $VPN_CONNECTION\nRelay: $VPN_RELAY\nFeatures: $VPN_FEATURES\nVisible Location: $VPN_VISIBLE_LOCATION"

get_status() {

  # Check if the VPN is connected
  if [ "$VPN_CONNECTION" = "$STATUS_CONNECTED" ]; then
    # VPN is connected
    echo "{ \"text\": \"$VPN_CONNECTION\", \"tooltip\": \"$TOOLTIP\", \"alt\": \"connected\", \"class\": \"connected\"}"

  elif [ "$VPN_CONNECTION" = "$STATUS_CONNECTING" ]; then
    # VPN is connecting
    echo "{ \"text\": \"$VPN_CONNECTION\",  \"tooltip\": \"$TOOLTIP\", \"alt\": \"connecting\", \"class\": \"connecting\"}"

  else
    # VPN is disconnected
    echo "{\"text\": \"$VPN_CONNECTION\",  \"tooltip\": \"$TOOLTIP\", \"alt\": \"disconnected\", \"class\": \"disconnected\"}"
  fi
}

toggle_connection() {
  # If VPN is connected, disconnect it
  if [ "$VPN_CONNECTION" = "$STATUS_CONNECTED" ]; then
    mullvad disconnect
    notify-send

  # If VPN is not connected, connect it
  elif [ "$VPN_CONNECTION" != "$STATUS_CONNECTED" ]; then
    mullvad connect
    notify-send
  fi

  sleep 1
}

reconnect() {
  mullvad reconnect
  notify-send

  sleep 1 # Hack to make the status return
}
