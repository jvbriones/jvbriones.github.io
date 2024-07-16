---
sidebar_position: 10
---

# Bash

- convert DOS files to MAC files

```bash
brew install dos2unix
dos2unix [file]
```

- creating files

``` bash
touch file.txt
touch files(1..100).txt —>100 files
```

- giving permissions

``` bash
chmod u=rwx,go=rx file
chmod 755 file (full permissions for owner, read and execute for others)
```

- open current folder from terminal

``` bash
open .
```

- see logs

``` bash
tail -1000f application.log
```

- count number of lines

``` bash
find . -name '*.py' | xargs wc -l | sort
```

- see all PATH values

``` bash
export -p
```

- see running processes

``` bash
ps -fea
ps aux | greep "process_name"
```

- see parent process

``` bash
ps -o ppid= 4157
```

- identify and stop the process that are listening on port 8086

``` bash
netstat -ano | findstr :8086
taskkill //PID 16796 //F
```
