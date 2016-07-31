#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

RVM_THEME_PROMPT_PRE_FIXED_LINE_BREAK="\n"
function disable_prefixed_line_break() {
	RVM_THEME_PROMPT_PRE_FIXED_LINE_BREAK=""
}

RVM_THEME_PROMPT_APPENDED_LINE_BREAK=" "
function enable_appended_line_break() {
	RVM_THEME_PROMPT_APPENDED_LINE_BREAK="\n"
}

if [ "$BASH_IT_THEME_ENABLE_PREPENDED_LINE_BREAK" = false ]; then
	disable_prefixed_line_break
fi

if [ "$BASH_IT_THEME_ENABLE_APPENDED_LINE_BREAK" = true ]; then
	enable_appended_line_break
fi

function prompt_command() {
    #PS1="${bold_cyan}$(scm_char)${green}$(scm_prompt_info)${purple}$(ruby_version_prompt) ${yellow}\h ${reset_color}in ${green}\w ${reset_color}\n${green}→${RVM_THEME_PROMPT_APPENDED_LINE_BREAK}${reset_color} "
    #PS1="${RVM_THEME_PROMPT_PRE_FIXED_LINE_BREAK}${purple}\h: ${reset_color} ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${RVM_THEME_PROMPT_APPENDED_LINE_BREAK}${reset_color} "
    #PS1="${RVM_THEME_PROMPT_PRE_FIXED_LINE_BREAK}${cyan}\h: ${reset_color} ${yellow}\w\n${red}$(scm_char)${red}$(scm_prompt_info) ${green}${RVM_THEME_PROMPT_APPENDED_LINE_BREAK}→${reset_color} "
    PS1="${RVM_THEME_PROMPT_PRE_FIXED_LINE_BREAK}${cyan}\h: ${reset_color} ${yellow}\w ${green}$(scm_prompt_info)${RVM_THEME_PROMPT_APPENDED_LINE_BREAK}${reset_color}→ "
}

safe_append_prompt_command prompt_command