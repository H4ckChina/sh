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
  echo "======= 系统命令 ======="
  echo "1. 系统更新"
  echo "2. 组件安装"
  echo "3. 安装 Masscan"
  echo "4. 安装 Node"
  echo "5. 修改名称"
  echo "6. 修改密码"
  echo "7. 重启系统"
  echo "----------------------"
  echo "0. 返回主菜单"
  echo "----------------------"
  read -p "请输入选项: " option
  case $option in
    1)
      echo "正在更新系统..."
      # 示例：以Ubuntu为例，更新系统
      sudo apt update && sudo apt upgrade -y
      ;;
    2)
      echo "正在安装必要组件..."
      # 示例：安装常用组件（根据需要修改安装包）
      sudo apt install -y curl wget git
      ;;
    3)
      echo "正在安装 Masscan..."
      sudo apt install -y masscan
      ;;
    4)
      echo "正在安装 Node.js 及 npm..."
      sudo apt install -y nodejs npm
      ;;
    5)
      echo "修改系统名称"
      read -p "请输入新的主机名称: " newname
      sudo hostnamectl set-hostname "$newname"
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
  echo "===== Proxy 操作 ====="
  echo "1. 创建 Proxy 窗口"
  echo "2. 运行 Proxy"
  echo "3. 恢复 Proxy 窗口"
  echo "4. 销毁 Proxy 窗口"
  echo "----------------------"
  echo "0. 返回主菜单"
  echo "----------------------"
  read -p "请输入选项: " choice
  case $choice in
    1)
      echo "正在创建 Proxy 窗口..."
      # 示例：如果需要使用 tmux 或 screen 来管理窗口，可以在这里调用相应命令
      # 如：tmux new -s proxy -d
      ;;
    2)
      echo "正在运行 Proxy..."
      # 示例：附加到 tmux 会话
      # tmux attach -t proxy
      ;;
    3)
      echo "正在恢复 Proxy 窗口..."
      # 示例：检查是否已存在窗口、重新恢复
      ;;
    4)
      echo "正在销毁 Proxy 窗口..."
      # 示例：杀掉 tmux 会话
      # tmux kill-session -t proxy
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
  echo "====== Get 操作 ======"
  echo "1. 创建 Get 窗口"
  echo "2. 运行 Get"
  echo "3. 恢复 Get 窗口"
  echo "4. 销毁 Get 窗口"
  echo "----------------------"
  echo "0. 返回主菜单"
  echo "----------------------"
  read -p "请输入选项: " choice
  case $choice in
    1)
      echo "正在创建 Get 窗口..."
      # 举例使用 tmux 创建新会话：tmux new -s get -d
      ;;
    2)
      echo "正在运行 Get..."
      # 例如运行某个脚本或命令
      ;;
    3)
      echo "正在恢复 Get 窗口..."
      # 恢复上次会话：tmux attach -t get
      ;;
    4)
      echo "正在销毁 Get 窗口..."
      # 销毁会话：tmux kill-session -t get
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
  echo "====== Scan 操作 ======"
  echo "1. 创建 Scan 窗口"
  echo "2. 运行 Scan"
  echo "3. 恢复 Scan 窗口"
  echo "4. 销毁 Scan 窗口"
  echo "----------------------"
  echo "0. 返回主菜单"
  echo "----------------------"
  read -p "请输入选项: " choice
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
    printf "|      H4ck China Sh       丨           v$sh_v         |\n" 
    printf "+------------------------------------------------------+\n"
    echo 
    echo "======= 主菜单 ======="
    echo "1. 系统命令"
    echo "2. Proxy"
    echo "3. Get"
    echo "4. Scan"
    echo "----------------------"
    echo "0. 退出"
    echo "----------------------"
    read -p "请选择菜单选项: " menuChoice
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
