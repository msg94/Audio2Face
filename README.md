Audio 2 Face WSL2 자동화 스크립트
WSL 버전 :  WSL2
Ubuntu 버전 : 24.04

실행 순서. 
1. `git clone https://github.com/msg94/Audio2Face.git`
2. `sudo ./Audio2Face/a2f_autoinstall.sh` 입력
3. 설치 완료후 WSL 자동 종료 후  수동으로 재실행
4. `./Audio2Face/a2f_envset.sh` 입력
5. 스크립트 설정 완료후 `export` 진행하여
   ![image](https://github.com/user-attachments/assets/8b250ba0-9508-4263-aaa2-7e84af55336e)
   사진과 같은 환경변수가 없을시
   `source ~/.bashrc` 명령어 입력후 다시 export 입력하여 확인

6. `./Audio2Face/a2f_rundocker.sh` 명령어 입력
7. ![image](https://github.com/user-attachments/assets/9302e41f-5c13-415f-a3d6-073b8cf4c47b)
   unauthorized 에러 발생시
   `docker logout`
   `sudo docker pull busybox` 실행
9. 
![Uploading image.png…]()
기다림의 시간....

11. 



   
