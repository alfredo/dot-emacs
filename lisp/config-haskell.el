(require 'haskell-mode)
(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)

(require 'company-ghci)
(push 'company-ghci company-backends)
(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'haskell-interactive-mode-hook 'company-mode)
