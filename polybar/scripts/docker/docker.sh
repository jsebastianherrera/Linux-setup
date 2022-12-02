wc=$(docker ps | wc -l)
if [ $wc -gt 1 ]; then
  echo "%{F#ffffff}"
else 
  echo "%{F#414244}"
fi
