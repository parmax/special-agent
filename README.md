# special-agent

Install & run the service
sudo ros config set rancher.repositories.special-agent.url https://raw.githubusercontent.com/parmax/special-agent/main
sudo ros service enable special-agent
sudo ros service up special-agent

# You can follow the progress of the setup, in another session, via:
sudo ros service logs --follow special-agent

# Build local image from Dockerfile
cd /home/rancher/special-agent
system-docker build -t parmax/special-agent .
