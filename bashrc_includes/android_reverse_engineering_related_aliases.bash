# Android reverse-engineering related aliases.
if [ "$(uname)" == "Darwin" ]; then
  # Based on brew installs.
  export ANDROID_HOME=/usr/local/opt/android-sdk
  alias jd-gui="open -a jd-gui"
  # These are for compiling native android code.
  # Based on brew install android-ndk.
  export ANDROID_NDK_HOME=/usr/local/Cellar/android-ndk/r9c/
  SYSROOT=${ANDROID_NDK_HOME}/platforms/android-14/arch-arm
  alias \
    ANDROID_CC="${ANDROID_NDK_HOME}/toolchains/arm-linux-androideabi-4.8/prebuilt/darwin-x86/bin/arm-linux-androideabi-gcc --sysroot=$SYSROOT " #-B /usr/local/google/android_src_code/system/core/include"
else
  export ANDROID_HOME=$HOME/android_sdk
  # On mac, these are installed via homebrew.
  # TODO(ashishb): On GNU/Linux, install it using some package manager as well.
  alias jd-gui="$HOME/AndroidTools/jd-gui/jd-gui"
  alias aapt="$HOME/tools/android/aapt"
  alias apktool="java -jar $HOME/tools/android/apktool.jar"
  alias dex2jar=$HOME/tools/android/dex2jar-0.0.9.15/d2j-dex2jar.sh
fi
export ANDROID_SDK_ROOT=$ANDROID_HOME
alias burp="java -jar $HOME/Tools/burpsuite_free_v1.5.jar"
alias printcert="keytool -printcert -file"
alias signapk="jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore alias_name"
alias android_screenshot="java -jar $HOME/tools/android/AndroidScreenCapture_1.1/AShot-1.1.jar"
alias get_android_id='adb shell content query --uri content://settings/secure --projection name:value | grep android_id'
function update_android_id(){
  # Update the android id.
  # TODO(ashishb): Add a different query for devices where sqlite3 is not present
  # but content binary is present.
  adb shell sqlite3 \
    /data/data/com.android.providers.settings/databases/settings.db \
    "update 'secure' set value=\"${1}\" where name='android_id'"
  # Now soft_reboot.
  adb shell setprop ctl.restart surfaceflinger
  adb shell setprop ctl.restart zygote
}
