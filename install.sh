#!/bin/bash

# 定义配置文件路径
CONFIG_DIR="$HOME/.config/shell_gpt"
CONFIG_FILE="$CONFIG_DIR/.sgptrc"

# 检查配置文件夹是否存在，不存在则创建
if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
    echo "Created config directory at $CONFIG_DIR"
fi

# 检查用户是否提供了 OPENAI_API_KEY
if [ -z "$OPENAI_API_KEY" ]; then
    echo "Error: OPENAI_API_KEY is not set. Please set it before running the script."
    exit 1
fi

# 检查 OPENAI_API_KEY 格式
if [[ ! $OPENAI_API_KEY == fk* || $OPENAI_API_KEY != *ck208* ]]; then
    echo "Error: The OPENAI_API_KEY is incorrect. Please ensure the key is correct or visit the URL to purchase a valid key."
    exit 1
fi

# 写入配置内容到文件
cat > "$CONFIG_FILE" <<EOL
CHAT_CACHE_PATH=/tmp/chat_cache
CACHE_PATH=/tmp/cache
CHAT_CACHE_LENGTH=100
CACHE_LENGTH=100
REQUEST_TIMEOUT=60
DEFAULT_MODEL=gpt-4o
DEFAULT_COLOR=magenta
ROLE_STORAGE_PATH=$CONFIG_DIR/roles
DEFAULT_EXECUTE_SHELL_CMD=false
DISABLE_STREAMING=false
CODE_THEME=dracula
OPENAI_FUNCTIONS_PATH=$CONFIG_DIR/functions
OPENAI_USE_FUNCTIONS=true
SHOW_FUNCTIONS_OUTPUT=false
API_BASE_URL=https://oa.api2d.net
PRETTIFY_MARKDOWN=true
USE_LITELLM=false
OPENAI_API_KEY=$OPENAI_API_KEY
SHELL_INTERACTION=true
OS_NAME=auto
SHELL_NAME=auto
EOL

echo "Configuration file created at $CONFIG_FILE"
