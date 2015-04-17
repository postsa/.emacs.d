;;This file determines how emacs indents different languages
;;basically we want indents of 2-spaces for each language




;;c and c++
(setq-default tab-width 2)

(setq-default c-basic-offset 2)
(setq-default js-indent-level 2)
(setq-default python-indent 2)
(setq-default sgml-basic-offset 2)
(setq-default css-indent-offset 2)

(provide 'indent-modes)
