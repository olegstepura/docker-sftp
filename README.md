# docker-sftp
Docker SFTP container image with `build` and `run` interactive scripts using [docker-shell](https://github.com/olegstepura/docker-shell).

## Usage
Build using:
```bash
./build.sh
```

Run using:
```bash
./run.sh
```

Scripts will ask you for all details before running actual commands and will print what it's going to run.  

## TODO:
* Logging is not working.
  http://stackoverflow.com/questions/22526016/docker-container-sshd-logs
  `rsyslogd`, `ln -sf /var/log... -> /dev/...` as done in some other container
  https://github.com/sullof/docker-sshd/blob/master/adds/supervisord.conf
  https://gist.github.com/crosbymichael/5794209

