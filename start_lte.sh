
#!/bin/bash

sudo daemon-reload
sudo systemctl enable lte_network.service
sudo systemctl start lte_network.service
sudo systemctl status lte_network.service






