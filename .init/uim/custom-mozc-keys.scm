(define mozc-on-key '("<IgnoreShift><Control>."))
(define mozc-on-key? (make-key-predicate '("<IgnoreShift><Control>.")))
(define mozc-off-key '("<IgnoreShift><Control>,"))
(define mozc-off-key? (make-key-predicate '("<IgnoreShift><Control>,")))
(define mozc-kana-toggle-key '())
(define mozc-kana-toggle-key? (make-key-predicate '()))
(define mozc-vi-escape-key '("escape" "<IgnoreCase><Control>s"))
(define mozc-vi-escape-key? (make-key-predicate '("escape" "<IgnoreCase><Control>s")))
