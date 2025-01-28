bind \t 'accept-autosuggestion' #to accept autosuggestion by pressing tab
#fish theme
set -g theme_display_git_default_branch yes
set -g theme_color_scheme zenburn


alias fishconfig “open -a 'Visual Studio Code' ~/.config/fish/config.fish”
alias sourcefish 'source ~/.config/fish/config.fish'
alias vscode “open -a 'Visual Studio Code'”

alias android 'cd ~/projects/playground/nowinandroid'
alias temp 'cd ~/projects/playground/temp/nowinandroid'
alias playground 'cd ~/projects/playground'
alias config 'cd ~/projects/android-app-config'

function tic
    open https://issuetracker.google.com/issues/$argv[1]
end

#proxy and disconnect
alias proxy 'adb shell settings put global http_proxy 192.168.68.57:8888'
alias disconnect_proxy 'adb shell settings put global http_proxy :0'

#record video, pull video to downloads and delete it
alias record 'adb shell screenrecord /sdcard/video.mp4'
alias pull_record 'adb pull /sdcard/video.mp4 ~/Desktop/Android-Recordings/video_$(date +“%m-%d-%y_%H-%M-%S”).mp4'
alias delete_record 'adb shell rm /sdcard/video.mp4'
alias videos 'open ~/Desktop/Android-Recordings/'

alias text “adb shell input text ”
alias next 'adb shell input keyevent 66' # focus next (press enter)

alias package 'adb shell pm list packages -f | grep '
alias uninstall 'adb uninstall '
function versionCode
    adb shell dumpsys package $argv[1] | grep versionCode
end

alias deeplink 'adb shell am start -a “android.intent.action.VIEW” -d '

alias talkback_on 'adb shell settings put secure enabled_accessibility_services com.google.android.marvin.talkback/com.google.android.marvin.talkback.TalkBackService'
alias talkback_off 'adb shell settings put secure enabled_accessibility_services com.android.talkback/com.google.android.marvin.talkback.TalkBackService'

alias clear_cache 'adb shell pm clear ' # clear app cache
alias kill_app_background 'adb shell am kill ' # simulate app killed in the background

#logcat
alias logcat 'adb logcat -c | adb logcat > '

#git
alias develop 'git checkout develop'
alias release 'git checkout release_build'
alias main 'git checkout main'
alias gp 'git pull'
alias gc 'git checkout'
alias gd 'git diff'
alias gd_last_commit 'git diff HEAD^ HEAD'
alias gs 'git status'
alias gl 'git log -10'
alias reset 'git reset --hard'
alias remove_last_commit 'git reset --hard HEAD^'
alias unstage_last_commit 'git reset --soft HEAD^'
alias force_push 'git push --force origin'

function pick
    git show $argv[1] | git apply
end
alias simulate_prod_app 'git show 140110810a09068e4c623a5805df98738388b18c | git apply'

alias reset_dev_hours “curl --location --request DELETE 'https://mgmt.auth.something.com/reset-tempass/v2.1/reset?device_id=116cbbf7a4b13e9495e66fd08e19414bc4742c98c94222b990b68c9053f8192f&requestor_id=reqId&mvpd_id=TempPass-OneApp-1min' --header 'Authorization: Bearer 0Z78yuSO2ot78MeLQWH3FcP2qXly'”
alias checkFeatureEnabled '~/projects/playground/script/checkFeatureEnabled.sh'

function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent
