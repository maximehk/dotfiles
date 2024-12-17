tbot_send() {
  curl -X POST \
       -H "Content-Type:multipart/form-data" \
       -F chat_id=$TELEGRAM_CHAT_ID \
       -F text="$1" \
       https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage | jq
}
