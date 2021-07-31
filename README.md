# rclone-docker-config
a Dockerfile to build a minimal rclone image that can take config from cli or environment

```bash
docker build -t rclone .

# config from command line
docker run -v <dir to backup>:/mnt/rclone \
    rclone -c "$(cat ~/.config/rclone/rclone.conf)" \
    sync <remote>:<dir> /mnt/rclone

# config from environment
docker run -v <dir to backup>:/mnt/rclone \
    -e RCLONE_CFG="$(cat ~/.config/rclone/rclone.conf)" \
    rclone sync /mnt/rclone <remote>:<dir>
```