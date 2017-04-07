SOURCE_APK=""
java -jar apktool_2.2.2.jar d -f ${SOURCE_APK}.apk
#do your modification
java -jar apktool_2.2.2.jar b -f $SOURCE_APK
mv ${SOURCE_APK}/dist/${SOURCE_APK}.apk ./${SOURCE_APK}-modified.apk
java -jar signapk.jar testkey.x509.pem testkey.pk8 ${SOURCE_APK}-modified.apk ${SOURCE_APK}-signed.apk
adb install -r ${SOURCE_APK}-signed.apk
