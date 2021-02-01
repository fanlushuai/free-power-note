#!/usr/bin/bash
################################
# add draft：false if draft not exist
################################

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

# 找到没有包含draft:的文件
docs_path=${1:-"${EXCUTE_PATH}../../../docs/"}
fileswithoutdraft=$( find ${docs_path} -name "*.md" -type f | xargs grep -L 'draft:')

for file in $fileswithoutdraft
do 
   firstLineMarkupCount=$(head -1 "$file" | grep -c '\-\-\-') 
   topMuiltLineMarkupCount=$(head -15 "$file" | grep -c '\-\-\-')
   # 猜测存在front matter。可能不准
   if [ $topMuiltLineMarkupCount -ge 2 -a $firstLineMarkupCount -eq 1 ]; then
      echo "$file guess frontmatter exsit[yes]"
      # 在第二行上添加draft
      sed -i '2i \
draft: true
' $file

   else 

      echo "$file guess frontmatter exsit[no]"
      sed -i '1i \
--- \
draft: true \
--- \
' $file

    fi
done