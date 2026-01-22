echo "downloading eget..."
curl -fsSL https://zyedidia.github.io/eget.sh | sh

# Install zsh if not already installed
if ! command -v zsh &> /dev/null; then
    echo "zsh not found, installing zsh..."
    # Detect OS and install zsh accordingly
    if [ -f /etc/debian_version ]; then
            echo -e "检测到 Debian/Ubuntu 系统"
            sudo apt update && sudo apt install -y zsh
        elif [ -f /etc/redhat-release ]; then
            echo -e "检测到 RHEL/CentOS/Fedora 系统"
            sudo yum install -y zsh
        elif [ -f /etc/arch-release ]; then
            echo -e "检测到 Arch Linux 系统"
            sudo pacman -S --noconfirm zsh
        else
            echo -e "未能识别的 Linux 发行版，请尝试手动安装。"
            exit 1
    fi