#!/usr/bin/bash
#===================
# clean imgs not used in *.md
#===================
# if current sh locate in .github/reurces/scripts/clean_imgs.sh
# this kind must excute by "xsh path/name.sh" ,due to $0 can get ./ if according ./xx.sh excute
EXCUTE_PATH=$(dirname ${0})/

# make both "bash ./a/x.sh" and "././a/x.sh" can excute
# but alse exist a little bug if same name sh scripts exist in nearby dir
if [ ! -e "${EXCUTE_PATH}${0##*/}" ];then
   EXCUTE_PATH= $(echo "${EXCUTE_PATH}" |sed 's/\.\///')
   if [ ! -e "${EXCUTE_PATH}${0##*/}" ];then
       exit 1
   fi
fi

# others please reset param $1 $2 $3
IMGS_DIR=${1:-"${EXCUTE_PATH}../../../img"}
MD_DIR=${2:-"${EXCUTE_PATH}../../../docs"}
BACK_DIR=${3:-"${EXCUTE_PATH}../../../img/no-ref/"}
echo $BACK_DIR
for fileName in $( ls -p $IMGS_DIR| grep -v / )
do 
   echo "$fileName"
   if [ ${0##*/} = $fileName ] ; then
   	continue
   fi
   #//todo 循环中使用管道的问题 https://www.cnblogs.com/orangeform/archive/2011/12/26/2272814.html
   if [ 0 -eq $(find $MD_DIR -name "*\.md" -type f | xargs cat | grep -c "$fileName") ] ;then
        echo "mv $IMGS_DIR/$fileName $BACK_DI"
	     mv "$IMGS_DIR/$fileName" "$BACK_DIR"
   fi
   
done
