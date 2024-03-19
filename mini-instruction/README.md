# Basic protection ssh connections
1) Add new user
Use a long and complex name and password!!!
> sudo adduser newuser

2) Give root access
> sudo usermod -aG sudo newuser

3) Block connection to root
> sudo nano  /etc/ssh/sshd_config

Search line with
> "PermitRootLogin yes"

Change to
> "PermitRootLogin no"

Restart ssh
> sudo systemctl restart sshd

4) Change ssh-port
> sudo nano /etc/ssh/sshd_config

Search line 
> Port 22

Change to other
> Port AnyNumberWhichOver1000

Restart ssh
> sudo systemctl restart sshd

5) Restrict ip entry

> sudo nano /etc/ssh/sshd_config

Search add line
> AllowUsers username@ip

Restart ssh
> sudo systemctl restart sshd
