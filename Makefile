

DESTSCRIPT=/usr/lib64/misc/xscreensaver/
DESTSERVICE=/usr/share/kde4/services/ScreenSavers/
DIR=/usr/share/AppleMovie

install: 
	@test -d	${DIR} || mkdir ${DIR}
	@test -d  	${DIR}/screensavers || mkdir  ${DIR}/screensavers
	@for saver in screensavers/*/*.mov; do \
		echo "$$saver" ;\
	install -m 0644 "$$saver" ${DIR}/screensavers; \
	done 
	@install -m 0644 src/input.conf ${DIR}
	@install -m 0755 src/AppleTvSaver ${DESTSCRIPT}/
	@install -m 0644 src/AppleTvSaver.desktop ${DESTSERVICE}/

test:
	kxsrun AppleTvSaver


download:
	@./download.py
