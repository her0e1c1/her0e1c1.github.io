(p"
- lift . return == return
- lift (m >>= k) == lift m >>= (lift . k)
")
