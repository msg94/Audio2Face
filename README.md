![image](https://github.com/user-attachments/assets/3864b7f7-a16f-41d1-a5f2-836133f04dbc)# Audio 2 Face WSL2 자동화 스크립트

### WSL 버전 :  WSL2

### Ubuntu 버전 : 24.04##

실행 순서. 

1. 깃허브 리포지트리 로컬에 복사
```
git clone https://github.com/msg94/Audio2Face.git
```
2. 도커 이미지 및 필요 라이브러리 설치
```
sudo ./Audio2Face/a2f_autoinstall.sh
```
 입력
 
3. 설치 완료후 WSL 자동 종료 후  수동으로 재실행

5. 환경변수 세팅(초기 세팅시 한번만 실행)
 ```
./Audio2Face/a2f_envset.sh
```
  입력

스크립트 설정 완료후 
```
export
```
   명령어 입력
   ![image](https://github.com/user-attachments/assets/8b250ba0-9508-4263-aaa2-7e84af55336e)
   사진과 같은 환경변수가 없을시
   
   ```
   source ~/.bashrc
   ```
 명령어 입력후 다시 export 입력하여 확인

6. 도커 이미지 실행 및 A2F 실행
```
./Audio2Face/a2f_rundocker.sh
```
 명령어 입력
8. ![image](https://github.com/user-attachments/assets/9302e41f-5c13-415f-a3d6-073b8cf4c47b)
   unauthorized 에러 발생시
   ```
   docker logout
   
   sudo docker pull busybox
   ```
   실행
   
11. 아래 사진과 같이 나오면 성공
![image](https://github.com/user-attachments/assets/2a5f1f36-6a47-4619-9791-3d5dbee63d7b)

# 리눅스 설치 끝

# 파이썬 세팅
1. Facial 프로젝트 폴더로 진입
![image](https://github.com/user-attachments/assets/ac118c9d-f3a0-4b14-bd45-95a34cf77c05)

2. 주소창에 CMD 입력
![image](https://github.com/user-attachments/assets/bf7a5c2e-536f-4e74-a6c2-e6069025e2dc)

3. cmd 창에 아래 명령어 입력
```
git clone https://github.com/NVIDIA/ACE.git
```
![image](https://github.com/user-attachments/assets/8c9b8bd7-eaef-4517-939f-eade9e0e4387)

4. python 가상환경 구축
```
py -m venv .venv
.\.venv\Scripts\activate
```
![image](https://github.com/user-attachments/assets/566dedb0-1fac-4f0a-8e30-730b94c5faf7)
가상환경 진입
5.wheel 설치 및 requiments 설치
```
cd .\ACE\microservices\audio_2_face_microservice\1.2\proto\sample_wheel
cd ..\scripts\audio2face_api_client
pip install -r .\requirements
```

6. 케이벨 A2F 스크립트 폴더로 접속
```
cd ..\..\..\..\..\..\unity-a2f\a2f_project_20250120\Audio2Face-3D-Samples\scripts\audio2face_3d_api_client
```
각 PC에 맞는 경로로 이동
![image](https://github.com/user-attachments/assets/224b8402-8ff8-4845-91a1-7a6c4b49cfd9)

7. 파이썬 코드 실행
```
py nim_a2f_3d_client.py [오디오파일] [config파일]
py nim_a2f_3d_client.py ..\..\example_audio\news.wav .\config\config_bodyguard.yml

```

웹소켓이 없다는 에러 뜰시
```
pip isntall websocekt
```
![image](https://github.com/user-attachments/assets/20387f78-bad6-44ca-8064-9922d4abed7e)


8. 유니티와 연동

![image](https://github.com/user-attachments/assets/4f078eb0-8352-4610-8382-c3f3508832f3)
사진과 같은 상태면 연동 준비 완료





   
