## 使用

 ``` 
docker run -d --name php-apache-dev \
  --restart=always \
  -v /yourcode:/app \
  -p 3000:80 \
  donjan/php-apache-dev:7.3.10
 ``` 
/yourcode 为代码在宿主机路径

进入容器

docker exec -it php-apache-dev bash
将你代码的入口文件连接到/var/www/html
rm -fr /var/www/html && ln -s /yourcode/public  /var/www/html

-p 3000:80 主机3000端口映射到容器80端口，通过127.0.0.1:3000就可以访问了

如果是以其他方式挂载目录，记得指定apache用户www-data，例如

 ``` 
--mount -t cifs //172.16.19.250/wwwroot /app -o username=user,password=pass,rw,dir_mode=0777,file_mode=0777,uid=33,gid=33
 ``` 


