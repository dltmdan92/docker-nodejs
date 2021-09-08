# 베이스 이미지를 명시해준다.
FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY 명령어를 통해 package.json을 도커 컨테이너의 지정된 장소에 복사해준다.
# 아래 파일은 cache가 적용되어 변경 여부 추적한다.
COPY package*.json ./

# 임시 컨테이너를 만든 후 도커 이미지 생성 전, 명령어를 실행하고 그 내용을 레이어로 적용
# 추가적으로 필요한 파일들을 다운로드
RUN npm install

# 현재 임시컨테이너에는 package.json만 넣어준 상태
# 다른 소스들도 전부 다 임시컨테이너에 넣어준다.
COPY . .

EXPOSE 8080
CMD ["node", "server.js"]