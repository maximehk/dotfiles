function adk_genenv {
    chezmoi execute-template '{{template "adk_env" .}}'
}