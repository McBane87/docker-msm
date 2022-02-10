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

4. Crate new user and/or give root user a password
```
docker exec msm useradd someUser 
docker exec msm usermod -aG wheel someUser #only if sudo is needed
docker exec msm passwd someUser

# OR

docker exec msm passwd root
```

5. Connect to Desktop, with credentials from above, using RDP on Port 33890
