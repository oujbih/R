result = tryCatch({
    expr
}, warning = function(w) {
    warning-handler-code
}, error = function(e) {
    error-handler-code
}, finally = {
    cleanup-code
}
