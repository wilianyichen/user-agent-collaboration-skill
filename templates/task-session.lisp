;; 通用任务会话函数：解释为 TaskSpec，不要求 Lisp 运行时。
;; 语义：
;; :owner      user | agent | shared
;; :cwd        绝对工作目录
;; :inputs     必读文件/URL
;; :actions    每项必须是一个可验证动作
;; :acceptance 可勾选、可观察的验收条件
;; :return     完成后回传的证据对象
;; :stop       触发立即停止的条件
;; :forbidden  禁止事项

(defun task-session (&key id cwd owner goal inputs actions acceptance return stop forbidden)
  (list
    (cons :id id)
    (cons :cwd cwd)
    (cons :owner owner)
    (cons :goal goal)
    (cons :inputs inputs)
    (cons :actions actions)
    (cons :acceptance acceptance)
    (cons :return return)
    (cons :stop stop)
    (cons :forbidden forbidden)))

;; 每个新会话只需复制一份实例化 let 块并替换变量值。
(let ((TASK_ID "${TASK_ID}")
      (CWD "${CWD}")
      (OWNER "${OWNER}")
      (GOAL "${GOAL}")
      (INPUTS (list ${INPUTS}))
      (ACTIONS (list ${ACTIONS}))
      (ACCEPTANCE (list ${ACCEPTANCE}))
      (RETURN "${RETURN}")
      (STOP (list ${STOP}))
      (FORBIDDEN (list ${FORBIDDEN})))
  (task-session TASK_ID CWD OWNER GOAL INPUTS ACTIONS ACCEPTANCE RETURN STOP FORBIDDEN))
