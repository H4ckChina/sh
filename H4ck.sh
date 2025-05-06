#!/bin/bash
sh_v="1.0.0"
# 定义一个暂停函数，用于在操作完成后等待用户按键
function pause(){
  read -p "按任意键继续..." -n1 -s
  echo ""
}

# 系统命令菜单：包含系统更新、组件安装、安装Masscan、安装Node、修改名称、修改密码、重启系统
function system_commands_menu() {
  clear
    printf "+------------------------------------------------------+\n"
    printf "|         1. 系统更新        |        2. 组件安装       |\n"
    printf "+------------------------------------------------------+\n"
    printf "|         3. 安装 Massca     |        4. 安装 Node     |\n"
    printf "+------------------------------------------------------+\n"
    printf "|         5. 修改名称        |        6. 修改密码       |\n"
    printf "+------------------------------------------------------+\n"
    printf "|         5. 重启系统        |        0. 返回主菜单     |\n"
    printf "+------------------------------------------------------+\n"
  echo
  read -p "请选择: " option
  case $option in
    1)
      echo "正在更新系统..."
      # 示例：以Ubuntu为例，更新系统
      sudo apt update && sudo apt upgrade -y
      ;;
    2)
      echo "正在安装必要组件..."
      sudo apt install -y curl ; apt install -y sudo ; apt install -y wget ; apt install -y screen 
      ;;
    3)
      echo "正在安装 Masscan..."
      sudo apt-get install masscan -y
      ;;
    4)
      echo "正在安装 Node.js 及 npm..."
      sudo apt install -y nodejs npm
      ;;
    5)
      echo "修改系统名称"
      sudo hostnamectl set-hostname H4ck
      ;;
    6)
      echo "修改密码"
      sudo passwd
      ;;
    7)
      echo "正在重启系统..."
      sudo reboot
      ;;
    0)
      return 0
      ;;
    *)
      echo "无效选项，请重新输入"
      ;;
  esac
  pause
  system_commands_menu
}

# Proxy 类菜单：包含创建、运行、恢复、销毁 Proxy 窗口
function proxy_menu() {
  clear
    printf "+------------------------------------------------------+\n"
    printf "|     1. 创建 Proxy 窗口     |    2. 运行 Proxy 程序   |\n"
    printf "+------------------------------------------------------+\n"
    printf "|     3. 恢复 Proxy 窗口     |    4. 销毁 Proxy 窗口   |\n"
    printf "+------------------------------------------------------+\n"
    printf "|                     0. 返回主菜单                    |\n"
    printf "+------------------------------------------------------+\n"
  echo
  read -p "请选择: " choice
  case $choice in
    1)
      echo "正在创建 Proxy 窗口..."
      screen -S Proxy
      ;;
    2)
      echo "正在运行 Proxy..."
      cd Proxy
      ./xmrig-proxy
      ;;
    3)
      echo "正在恢复 Proxy 窗口..."
      screen -r Proxy
      ;;
    4)
      echo "正在销毁 Proxy 窗口..."
      screen -S Proxy -X quit
      ;;
    0)
      return 0
      ;;
    *)
      echo "无效选项，请重新输入"
      ;;
  esac
  pause
  proxy_menu
}

# Get 类菜单：包含创建、运行、恢复、销毁 Get 窗口
function get_menu() {
  clear
   printf "+------------------------------------------------------+\n"
    printf "|     1. 创建 Get 窗口      |     2. 运行 Get 程序     |\n"
    printf "+------------------------------------------------------+\n"
    printf "|     3. 恢复 Get 窗口      |     4. 销毁 Get 窗口     |\n"
    printf "+------------------------------------------------------+\n"
    printf "|                     0. 返回主菜单                    |\n"
    printf "+------------------------------------------------------+\n"
  echo
  read -p "请选择: " choice
  case $choice in
    1)
      echo "正在创建 Get 窗口..."
      screen -S GET
      ;;
    2)
      echo "正在运行 Get..."
      cd /root/Get
      node Get.js
      ;;
    3)
      echo "正在恢复 Get 窗口..."
      screen -r GET
      ;;
    4)
      echo "正在销毁 Get 窗口..."
      screen -S GET -X quit
      ;;
    0)
      return 0
      ;;
    *)
      echo "无效选项，请重新输入"
      ;;
  esac
  pause
  get_menu
}

# Scan 类菜单：包含创建、运行、恢复、销毁 Scan 窗口
function scan_menu() {
  clear
    printf "+------------------------------------------------------+\n"
    printf "|     1. 创建 Scan 窗口      |     2. 运行 Scan 程序   |\n"
    printf "+------------------------------------------------------+\n"
    printf "|     3. 恢复 Scan 窗口      |     4. 销毁 Scan 窗口   |\n"
    printf "+------------------------------------------------------+\n"
    printf "|                     0. 返回主菜单                    |\n"
    printf "+------------------------------------------------------+\n"
  echo
  read -p "请选择: " choice
  case $choice in
    1)
      echo "正在创建 Scan 窗口..."
      # 示例：tmux new -s scan -d
      ;;
    2)
      echo "正在运行 Scan..."
      # 例如运行 masscan 或其他扫描命令
      ;;
    3)
      echo "正在恢复 Scan 窗口..."
      # tmux attach -t scan
      ;;
    4)
      echo "正在销毁 Scan 窗口..."
      # tmux kill-session -t scan
      ;;
    0)
      return 0
      ;;
    *)
      echo "无效选项，请重新输入"
      ;;
  esac
  pause
  scan_menu
}

# 主菜单：用于选择各个大类
function main_menu() {
  while true; do
    clear
    printf "+------------------------------------------------------+\n"
    printf "|        H4ck China Sh       |          v$sh_v         |\n"
    printf "+------------------------------------------------------+\n"
    printf "|         1. 系统命令        |          2. Proxy       |\n"
    printf "+------------------------------------------------------+\n"
    printf "|         3. Get             |          4. Scan        |\n"
    printf "+------------------------------------------------------+\n"
    printf "|                        0. 退出                       |\n"
    printf "+------------------------------------------------------+\n"
    echo 
    read -p "请选择: " menuChoice
    case $menuChoice in
      1)
        system_commands_menu
        ;;
      2)
        proxy_menu
        ;;
      3)
        get_menu
        ;;
      4)
        scan_menu
        ;;
      0)
        echo "退出脚本"
        exit 0
        ;;
      *)
        echo "无效选项，请重试"
        ;;
    esac
  done
}

# 执行主菜单
main_menu
