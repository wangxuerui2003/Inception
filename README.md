# Inception
Create a LEMP stack website using 3 docker containers, 2 volumes and 1 docker network

## Install Docker on Debian (Just run the script)
```bash
# Uninstall all the unofficial packages
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg -y; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

# install docker cli and docker compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## To avoid the need of using 'sudo' in front of every docker command
```bash
# Add user to the docker group
$ sudo usermod -aG docker $USER
```

## The .env file (under /srcs)
```
MYSQL_ROOT_PASSWORD=<your_mysql_root_password>
MYSQL_USER=<your_mysql_user>
MYSQL_PASSWORD=<your_mysql_password>
MYSQL_DATABASE=<your_wordpress_database_name>

WP_ADMIN_USER=<your_wp_admin_user>
WP_ADMIN_PASSWORD=<your_wp_admin_pwd>
WP_ADMIN_EMAIL=<your_wp_admin_email>

WP_USER_PASSWORD=<your_normal_wp_user_pwd>

FTP_USER=<your_ftp_username>
FTP_PASSWORD=<your_ftp_password>
```

### Ports used
* wordpress (nginx): **443**
* ftp: **20, 21, 40000-40002**
* static site: **4587**
* adminer: **8080**