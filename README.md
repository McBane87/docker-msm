# docker-msm
Docker Image with XRDP and Megaraid Storage Manager  
  
1. Build Image
```
docker build -t local/msm .
```

2. Create Container
```
docker create \
        --name=msm \
        --privileged \
        -p 33890:3389 \
        --restart always \
        local/msm
```

3. Start Container
```
docker start msm
```

4. (Optional) Create new user and/or give root user a password
```
docker exec msm useradd someUser 
docker exec msm usermod -aG wheel someUser #only if sudo is needed
docker exec -it msm passwd someUser
```

5. (Mandatory) Give root user a password
```
docker exec -it msm passwd root
```

6. Connect to Desktop, with credentials from above (root or other user), using RDP on Port 33890
7. Find MSM Software in Start Menu (Applications > System > MegaRAID Storage Manager StartUpUI)
8. In the upcoming login prompt:
    * For "Full Access", you need to input the credentials of your root user
    * For "View Only", you can just enter the credentials of your current user
