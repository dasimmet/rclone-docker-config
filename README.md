# rclone-docker-config
a Dockerfile to build a minimal rclone image that can take config from cli

```bash
docker build -t rclone .
docker run -v <dir to backup>:/mnt/rclone rclone sync <remote>:<dir> /mnt/rclone
docker run -v <dir to backup>:/mnt/rclone rclone sync /mnt/rclone <remote>:<dir>
```