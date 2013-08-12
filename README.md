# docker-mysql

A Dockerfile to build a simple MySQL server container.

MySQL credentials are: `root / root4mysql`.

Build and run:
<pre>
git clone https://github.com/abulte/docker-mysql.git
cd docker-mysql
docker build -t [your-image-name] .
docker run -d [your-image-name] 
</pre>