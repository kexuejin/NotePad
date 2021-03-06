debug:
	ant debug

release:
	ant release

bin/NotePad-debug.apk: res/values/arrays.xml
	ant debug

bin/NotePad-release.apk: res/values/arrays.xml
	ant release

clean:
	ant clean

install: bin/NotePad-debug.apk
	adb install -r bin/NotePad-debug.apk

installrelease: bin/NotePad-release.apk
	adb install -r bin/NotePad-release.apk

translations:
	get-diff-translations
	python listlang.py
	python escapetranslations.py

langs:
	python listlang.py
	python escapetranslations.py

res/values/arrays.xml:
	python listlang.py
	python escapetranslation.py
