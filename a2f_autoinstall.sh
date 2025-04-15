#!/bin/bash

# 사용자 이름 확인
USERNAME=$(whoami)

echo ">> Step 1: 시스템 업데이트 및 도커 설치"
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl https://get.docker.com/ | sudo sh

echo ">> Step 2: 도커 그룹 및 권한 설정"
sudo groupadd docker 2>/dev/null
sudo usermod -aG docker $USERNAME

echo ">> Step 3: 도커 컴포즈 플러그인 설치"
sudo apt-get update
sudo apt-get install -y docker-compose-plugin
docker compose version

echo ">> Step 4: NVIDIA Container Toolkit 저장소 등록 및 키 설정"
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
  sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

echo ">> Step 5: experimental 주석 해제"
sudo sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list

echo ">> Step 6: NVIDIA Container Toolkit 설치"
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

echo ">> Step 7: NVIDIA Docker 런타임 구성"
sudo nvidia-ctk runtime configure --runtime=docker

echo ">> Step 8: 도커 서비스 재시작"
sudo systemctl restart docker

echo ""
echo " 설치 완료!"
echo " WSL 인스턴스를 종료하여 변경 사항을 적용합니다..."
echo " 터미널을 다시 열고 'docker run hello-world'로 테스트하세요."

sleep 3
/mnt/c/Windows/System32/wsl.exe --shutdown || {
    echo "자동 종료 실패: 수동으로 WSL을 재시작하세요."
    exit 1
}
