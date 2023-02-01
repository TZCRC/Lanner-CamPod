# Set up a raspberry pi as a USB gadget
# After imaging, run in the 'root' partition of SD card:

# Enable SSH
touch $1/ssh

# Append and modify text in the config and cmdline files
echo 'dtoverlay=dwc2' >> $1/config.txt
sed -i '.bk' 's/rootwait/rootwait\ modules-load=dwc2,g_ether/g' $1/cmdline.txt