#!/bin/bash

# 定义配置文件路径
CONFIG_FILE="$HOME/.config/shell_gpt/.sgptrc"

# 检查配置文件是否存在
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Configuration file not found at $CONFIG_FILE."
    echo "Please run the initial setup script first."
    exit 1
fi

# 提供模型选项
echo "Please select the model you want to use:"
echo "1) gpt-4"
echo "2) gpt-4o"
echo "3) gpt-4o-mini"
echo "Enter the number corresponding to your choice:"

# 读取用户输入
read -r choice

# 根据用户选择更新模型
case $choice in
    1)
        NEW_MODEL="gpt-4"
        ;;
    2)
        NEW_MODEL="gpt-4o"
        ;;
    3)
        NEW_MODEL="gpt-4o-mini"
        ;;
    *)
        echo "Invalid selection. Please run the script again and choose a valid option."
        exit 1
        ;;
esac

# 更新配置文件中的 DEFAULT_MODEL
sed -i "s/^DEFAULT_MODEL=.*/DEFAULT_MODEL=$NEW_MODEL/" "$CONFIG_FILE"

echo "DEFAULT_MODEL has been updated to $NEW_MODEL in $CONFIG_FILE"
