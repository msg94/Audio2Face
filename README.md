# Audio 2 Face WSL2 자동화 스크립트

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

# 끝 




   
