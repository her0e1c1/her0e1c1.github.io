
(ps "false")

(run "perl -E 'say $a || \"\" || 0'")
(node "undefined || null || \"\" || 0 || false")
