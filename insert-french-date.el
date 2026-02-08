
(defun insert-french-date ()
  "Open visual calendar and insert French formatted date"
  (interactive)
  (require 'calendar)
  
  (let ((original-buffer (current-buffer)))
    
    ;; Start calendar
    (calendar)
    
    ;; Function to execute when date is selected
    (fset 'insert-my-date
          (lambda ()
            (interactive)
            (let* ((calendar-date (calendar-cursor-to-date))
                   (month (nth 0 calendar-date))
                   (day (nth 1 calendar-date))
                   (year (nth 2 calendar-date))
                   (time-value (encode-time 0 0 0 day month year)))
              
              ;; Close calendar window
              (quit-window)
              
              ;; Return to original buffer
              (switch-to-buffer original-buffer)
              
              ;; Insert the date
              (insert (format-time-string "%A %d/%m/%Y" time-value)))))
    
    ;; Bind the function in calendar mode
    (define-key calendar-mode-map (kbd "i") 'insert-my-date)
    (define-key calendar-mode-map (kbd "<return>") 'insert-my-date)
    
    ;; Help message
    (message "Navigate with arrows, press i or Enter to insert date")))


(global-set-key (kbd "C-c i") 'insert-french-date)
