## 使用

 ``` 
docker run -d --name php-apache-dev \
  --restart=always \
  -v /yourcode:/app \
  -p 3000:80 \
  -e WWWROOT_DIR=/app/public
  donjan/php-apache-dev:master-dev
 ``` 
WWWROOT_DIR 为入口文件所在

如果是以其他方式挂载目录，记得指定apache用户www-data，例如

 ``` 
--mount -t cifs //172.16.19.250/wwwroot /app -o username=user,password=pass,rw,dir_mode=0777,file_mode=0777,uid=33,gid=33
 ``` 


