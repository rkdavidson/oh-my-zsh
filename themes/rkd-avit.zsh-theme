#
# Author:: Andrew Vit (<andrew@avit.ca>)
#
# AVIT ZSH Theme
#
# Copyright 2011, Andrew Vit
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PROMPT='
%{$fg_bold[cyan]%}☯%{$reset_color%} $(_user_host)${_current_dir} $(git_prompt_info) $(_ruby_version)
%{$fg_bold[green]%}› %{$reset_color%}'

PROMPT2='%{$fg[green]%}ᄂ%{$reset_color%} '

#RPROMPT='$(_vi_status)%{$(echotc UP 1)%}$(_git_time_since_commit) $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}'
RPROMPT='$(_vi_status)%{$(echotc UP 1)%} ${_return_status}%{$(echotc DO 1)%}'


local _current_dir="%{$fg[blue]%}%6~%{$reset_color%}"
local _return_status="%{$fg_bold[red]%}%(?..⚠)%{$reset_color%}"
local _hist_no="%{$fg[grey]%}%h%{$reset_color%}"

function _user_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[magenta]%}$me%{$reset_color%}:"
  fi
}

# function _prompt_nvm() {
#   local node_version=$(nvm current)
#   [[ -z "${node_version}" ]] || [[ ${node_version} = "none" ]] || [[ ${node_version} = "system" ]] && return

#   echo "%{$fg_bold[grey]%}‹%{$reset_color%}%{$fg_bold[green]%}\U2B22%{$reset_color%}%{$fg_bold[white]%} ${node_version:1}%{$reset_color%}%{$fg_bold[grey]%}›%{$reset_color%}"
# }

function _vi_status() {
  if {echo $fpath | grep -q "plugins/vi-mode"}; then
    echo "$(vi_mode_prompt_info)"
  fi
}

function _ruby_version() {
  if {echo $fpath | grep -q "plugins/rvm"}; then
    echo "%{$fg[grey]%}$(rvm_prompt_info)%{$reset_color%}"
  fi
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
# function _git_time_since_commit() {
#   if git rev-parse --git-dir > /dev/null 2>&1; then
#     # Only proceed if there is actually a commit.
#     if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
#       # Get the last commit.
#       last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
#       now=$(date +%s)
#       seconds_since_last_commit=$((now-last_commit))

#       # Totals
#       minutes=$((seconds_since_last_commit / 60))
#       hours=$((seconds_since_last_commit/3600))

#       # Sub-hours and sub-minutes
#       days=$((seconds_since_last_commit / 86400))
#       sub_hours=$((hours % 24))
#       sub_minutes=$((minutes % 60))

#       if [ $hours -gt 24 ]; then
#           commit_age="${days}d"
#       elif [ $minutes -gt 60 ]; then
#           commit_age="${sub_hours}h${sub_minutes}m"
#       else
#           commit_age="${minutes}m"
#       fi

#       color=$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL
#       echo "$color$commit_age%{$reset_color%}"
#     fi
#   fi
# }

if [[ $USER == "root" ]]; then
  CARETCOLOR="red"
else
  CARETCOLOR="white"
fi

MODE_INDICATOR="%{$fg_bold[yellow]%}❮%{$reset_color%}%{$fg[yellow]%}❮❮%{$reset_color%}"

# ꊼ ꊱ ꎍ ꒊ פֿ שׁ ☯ ॐ
# ⽊ ⼲ ⼈ ⽂ ⽬ ⼮ ⺋ ⺀⺜ ⼺ 〣 ⼬ ⶎ ⶒ ㆗ ㄓ ペ ⽖ ㄐ 㒲 㞥 㞢 全 屳 ꁊ ꈾ
# ☰ ☯ ☣ ☀ ☠ ♆ ☹ ☫ ☐ ☑ ☒ ♁ ♅ ☉ ☊ ☛ ☥ ⚘ ⚠ ⚙ ♫ ♞ ⚭ ⚰ ⛢ ⚚ ⚒ ⚔ ⚕ ❀ ❍ ✮ ✫ ✓ ✂ ✈ ✕ ✎ ⟁ ➠ ❯ ✱ ⣿ ⧗ ⨀ ⧐ ⧖ ⨬ ⨠ ⭑
# ⃪ ⁆ ⁞ ⁓ ⁗ ⁙ → ⇁ ↻ ↟ ⇝ ∃ ≻ ⊡ ⋈ ⊳ ⊷ ⋱⌁ ≜ ≡ ⌘ ⌦ ⌁ ⊿ 〉 ⌂ ⌬ ⏣ ⑃ ⑂ ⑊ ⑉ ⨂ ⨯ ⪥ ⪢ ⪧ ⭠ ⮁⬙ ⬎ ⫱ ⫶ ⫘ ⫚ ⫛ ⧲ ⦊
# ᄉሗሗቸ ፨ ኦ ዳ ዿ ፠ ፥ ᖪ ᗌ ᗒ ᗮ ᚛ ᚖ ᚋ ᚚ ᙇ ᓬ ᕒ ᔂ  ᔃ  ᔀ  ᑅ  ᑀ  ᐥ ᐦ ᐞ ᐟ ᕯ ⃠ ⅄ ⃕ ⃗ ⁑ ⁕ ⁁ › ⅎ
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}ሗ  %{$reset_color%}%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}⏣%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}✕ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}◒ "

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg_bold[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg_bold[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg_bold[grey]%}"

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
#export GREP_COLOR='1;33'

