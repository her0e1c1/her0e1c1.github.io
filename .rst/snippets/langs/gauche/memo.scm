

; :error filename 
(process-output->string cmd :error (current-error-port))
