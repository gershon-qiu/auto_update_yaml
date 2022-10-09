currentdate=$(date +%Y%m%d)  
currentmonth=$(date +%Y%m)
currentmonths=$(date +%m)
currentyears=$(date +%Y)
filename=./nodefree.yaml
urlpath=https://nodefree.org/dy/$currentmonth/$currentdate.yaml

echo $filename
echo $urlpath
if [ -f "$filename" ];then
	 rm $filename
	 echo delete old subscribes
fi
echo 'get subscribe'
curl -O $urlpath
mv $currentdate.yaml  $filename
echo 'modify select mode'
sed -i '1,/聊天软件/s#type: select#type: url-test\n url: http://www.gstatic.com/generate_204\n tolerance: 50\n interval: 300#g' $filename
echo 'bye~'
