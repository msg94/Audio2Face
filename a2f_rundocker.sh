#!/bin/bash
set -e

# [1] 경로 이동
cd "$LOCAL_CONFIGS"

# [2] 도커 로그인 (ID = $oauthtoken 문자 그대로 사용)
echo "$NGC_API_KEY" | sudo docker login nvcr.io -u '$oauthtoken' --password-stdin

# [3] 도커 컨테이너 실행 및 명령 실행 자동화
sudo docker run -it --rm --name audio2face-3d \
  --gpus all \
  --network=host \
  --entrypoint /bin/bash \
  -w /opt/nvidia/a2f_pipeline \
  -e NIM_DISABLE_MODEL_DOWNLOAD=true \
  -e NIM_SKIP_A2F_START=true \
  -v "$LOCAL_NIM_CACHE:/root/.cache/audio2face-3d" \
  -v "$LOCAL_CONFIGS:/root/.cache/audio2face-3d-configs" \
  nvcr.io/nim/nvidia/audio2face-3d:1.2 \
  -c "bash -c '
    /opt/nim/start_server.sh & 
    sleep 3 && \
    ./service/generate_trt_models.py && \
    /usr/local/bin/a2f_pipeline.run
  '"
