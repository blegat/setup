alias gp='git push'
alias vim='nvim'

jp() {
	cd ~/.julia/dev
	if [ "$#" -ge 1 ]; then
		cd $1
	fi
}

jclone() {
	cd ~/.julia/dev
    git clone "git@github.com:$1/$2.jl.git" && mv $2.jl $2 && cd $2
}

alias jformat="julia -e 'using JuliaFormatter; format(\"src\"); format(\"test\")'"
alias jformatall="julia -e 'using JuliaFormatter; format(\".\", verbose=true)'"

# Julia REPL for Vim
jv() {
    julia "$@" -i -e 'using Revise; using REPLSmuggler; smuggle()'
}

jt() {
    if [ -f test/Project.toml ]; then
        jv --project=test
    else
        jv --project
    fi
}

jd() {
    jv --project=docs
}
