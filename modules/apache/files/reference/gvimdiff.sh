
for f in 2.2/etc/httpd/conf/extra/*conf
do gvimdiff $f 2.4/etc/httpd/conf/extra/${f##*/}
done

