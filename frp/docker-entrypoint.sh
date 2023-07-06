#!/bin/sh

echo -e "======================1. 检测配置文件========================\n"
#配置文件的位置
orig_frp="/frp/config/${FRP_RUN}.ini"
conf_frp="/app/${FRP_RUN}.ini"
echo -e "检查 ${FRP_RUN}.ini 的配置文件..."
if [ -f "$orig_frp" ]; then
    echo -e "将配置文件复制到 /app 文件夹..."
    rm -f $conf_frp
    cp -arf $orig_frp $conf_frp

else
    echo -e "找到用户设置文件: $conf_frp"
    cp -arf $conf_frp $orig_frp 
fi
# rm -f $orig_frp
# ln -s $conf_frp $orig_frp

echo -e "======================3. 启动${FRP_RUN}========================\n"


/app/${FRP_RUN} -c /app/${FRP_RUN}.ini
