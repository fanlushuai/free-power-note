#!/usr/bin/bash
set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable

################################
# add draft：false if draft not exist
################################

# this kind must excute by "xsh path/name.sh" ,due to $0 can get ./ if according ./xx.sh excute
EXCUTE_PATH=$(dirname "${0}")/

# make both "bash ./a/x.sh" and "././a/x.sh" can excute
# but alse exist a little bug if same name sh scripts exist in nearby dir
if [ ! -e "${EXCUTE_PATH}${0##*/}" ]; then
   EXCUTE_PATH=$(echo "${EXCUTE_PATH}" | sed 's/\.\///')
   if [ ! -e "${EXCUTE_PATH}${0##*/}" ]; then
      exit 1
   fi
fi

# 找到没有包含draft:的文件
docs_path=${1:-"${EXCUTE_PATH}../../../docs/"}

find "${docs_path}" -name "*.md" -type f -print0 | while IFS= read -r -d '' line; do
   #    包含draft的不处理
   if [ "$(head -20 "$line" | grep -c 'draft:')" -gt 0 ]; then
      echo "$line head 15 inclue draft"
      continue
   fi

   firstLineMarkupCount=$(head -1 "$line" | grep -c '\-\-\-')
   topMuiltLineMarkupCount=$(head -15 "$line" | grep -c '\-\-\-')
   # 猜测存在front matter。可能不准
   if [ "$topMuiltLineMarkupCount" -ge 2 ] && [ "$firstLineMarkupCount" -eq 1 ]; then
      echo "$line guess frontmatter exsit[yes]"
      # 在第二行上添加draft
      sed -i '2i \
draft: true
' "$line"

   else

      echo "$line guess frontmatter exsit[no]"
      # sed -i 基于stream操作，无法操作空文件，即无stream的文件。
      if [[ ! -s "$line" ]]; then
         # EOF的结束标签，必须放到最前面。不然不被识别。
         cat >"$line" <<EOF
---
draft: true
--- 
EOF
      else

         sed -i '1i \
--- \
draft: true \
--- \
' "$line"
      fi

   fi

done
