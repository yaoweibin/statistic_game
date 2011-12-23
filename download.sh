lynx -dump -nolist -justify -force_html -display_charset gb2312 $1 > tmp
iconv -c -s -f GB2312 -t UTF-8 tmp > res
