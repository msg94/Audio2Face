#!/bin/bash
set -e  # 에러 발생 시 중단

echo "🔧 [1/6] .bashrc에 Audio2Face 환경변수 추가 중..."

# 기존 블록 제거 후 재삽입
if grep -q "### >>> Audio2Face ENV START >>>" "$HOME/.bashrc"; then
    echo "⚠️ 기존 Audio2Face 블록 감지됨. 제거 후 재삽입."
    sed -i '/### >>> Audio2Face ENV START >>>/,/### <<< Audio2Face ENV END <<</d' "$HOME/.bashrc"
fi

# 환경 변수 블록 추가 ($HOME 이스케이프 없이 정확히 삽입)
cat <<EOF >> "$HOME/.bashrc"

### >>> Audio2Face ENV START >>>
export NGC_API_KEY=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
export CONTAINER_NAME=audio2face
export LOCAL_CONFIGS=$HOME/.cache/audio2face-3d-configs
export LOCAL_NIM_CACHE=$HOME/.cache/audio2face-3d
### <<< Audio2Face ENV END <<<
EOF

echo "✅ .bashrc에 환경 변수 블록 삽입 완료!"

echo "🧠 [2/6] 현재 쉘 세션에 환경 변수 적용 중..."
# 세션에 수동 적용
export NGC_API_KEY=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
export CONTAINER_NAME=audio2face
export LOCAL_CONFIGS=$HOME/.cache/audio2face-3d-configs
export LOCAL_NIM_CACHE=$HOME/.cache/audio2face-3d

echo "🔄 [3/6] source ~/.bashrc 명령으로 환경 변수 재적용..."
source "$HOME/.bashrc"

echo "✅ 현재 쉘에 환경변수 적용됨: LOCAL_CONFIGS=$LOCAL_CONFIGS"

echo "📁 [4/6] 디렉토리 생성 및 권한 설정 중..."
mkdir -p "$LOCAL_CONFIGS"
mkdir -p "$LOCAL_NIM_CACHE"
chmod 777 "$LOCAL_NIM_CACHE"

echo "✅ 디렉토리 생성 완료:"
echo "    - $LOCAL_CONFIGS"
echo "    - $LOCAL_NIM_CACHE"

echo "📦 [5/6] Audio2Face 디렉토리에서 .yaml 복사 중..."
A2F_SOURCE_DIR="$HOME/Audio2Face"
if [ -d "$A2F_SOURCE_DIR" ]; then
    find "$A2F_SOURCE_DIR" -type f -name "*.yaml" -exec cp {} "$LOCAL_CONFIGS" \;
    echo "✅ .yaml 복사 완료!"
else
    echo "⚠️ 복사할 Audio2Face 폴더 없음: $A2F_SOURCE_DIR"
fi

echo "🚀 [6/6] 디렉토리 이동 시도 중..."
if [ -d "$LOCAL_CONFIGS" ]; then
    cd "$LOCAL_CONFIGS"
    echo "✅ 디렉토리 이동 완료: $(pwd)"
else
    echo "❌ 디렉토리 없음: $LOCAL_CONFIGS"
    exit 1
fi

echo ""
echo "🎉 모든 설정이 완료되었습니다!"
echo "📌 환경 변수 확인: echo \$LOCAL_CONFIGS"
echo "📌 다음 터미널에서도 자동 적용됩니다."
