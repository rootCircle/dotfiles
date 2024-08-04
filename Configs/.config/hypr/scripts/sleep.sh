swayidle -w timeout 500 'swaylock -f' \
  timeout 1500 'playerctl pause -a; systemctl suspend' resume 'hyprctl dispatch dpms on' \
  before-sleep 'playerctl pause -a; swaylock -f' \
  after-resume 'hyprctl dispatch dpms on' \
  lock 'swaylock -f' &
  # timeout 10 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' \ # Display off doesn't seem to work for some reasons, causes black screen on restore from suspend, one way is to use a daemon

