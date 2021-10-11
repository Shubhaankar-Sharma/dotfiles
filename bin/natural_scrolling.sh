touchpadid=$(xinput list --id-only 'ASUE140A:00 04F3:3134 Touchpad')

echo $touchpadid

xinput --set-prop $touchpadid 'libinput Natural Scrolling Enabled' 1