NAME=packer
VERSION=0.10.0
ITERATION=1
ARCH=x86_64

fetch:
	wget https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_linux_amd64.zip
	mkdir -p ./usr/local/packer
	unzip -d ./usr/local/packer packer_${VERSION}_linux_amd64.zip
	rm packer_${VERSION}_linux_amd64.zip

all: rpm deb
rpm: fetch
	fpm --name ${NAME} --version ${VERSION} --iteration ${ITERATION} -a ${ARCH} -t rpm -s dir ./usr/local/packer
deb: fetch
	fpm --name ${NAME} --version ${VERSION} --iteration ${ITERATION} -a ${ARCH} -t deb -s dir ./usr/local/packer
test: fetch
	fpm --name ${NAME} --version ${VERSION} --iteration ${ITERATION} -a ${ARCH} -t deb -s dir ./usr/local/packer
	# TravisCI is a debian server
