#!/bin/bash
set -e  # 에러 발생 시 종료

echo ">> 환경 변수 및 디렉토리 설정 중..."

# 1. ~/.bashrc에 환경 변수 추가 (중복 방지)
BASHRC=~/.bashrc

add_if_not_exists() {
    local line="$1"
    grep -qxF "$line" "$BASHRC" || echo "$line" >> "$BASHRC"
}

add_if_not_exists "export NGC_API_KEY=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"
add_if_not_exists "export CONTAINER_NAME=audio2face"
add_if_not_exists "export LOCAL_CONFIGS=\$HOME/.cache/audio2face-3d-configs"
add_if_not_exists "export LOCAL_NIM_CACHE=\$HOME/.cache/audio2face-3d"

echo ">> .bashrc에 환경 변수 추가 완료!"

# 2. 현재 세션에도 바로 적용
export NGC_API_KEY=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
export CONTAINER_NAME=audio2face
export LOCAL_CONFIGS=$HOME/.cache/audio2face-3d-configs
export LOCAL_NIM_CACHE=$HOME/.cache/audio2face-3d

echo ">> 환경 변수 적용 완료"

# 3. 디렉토리 생성 및 권한 부여
mkdir -p "$LOCAL_CONFIGS"
mkdir -p "$LOCAL_NIM_CACHE"
chmod 777 "$LOCAL_NIM_CACHE"

echo "디렉토리 생성 및 권한 설정 완료!"
echo "이동: $LOCAL_CONFIGS"
cd "$LOCAL_CONFIGS"

# .bashrc 내용 확인 여부 안내
echo "다음 로그인 시 환경 변수가 자동으로 적용됩니다."