tsend () {
  curl -X POST \
       -H "Content-Type:multipart/form-data" \
       -F chat_id=$TELEGRAM_CHAT_ID \
       -F 'text=<-' \
       https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage | jq
}
