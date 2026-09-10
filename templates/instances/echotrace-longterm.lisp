;; 会话名：echotrace-longterm
;; 工作目录：D:\projects\Project\wx_comunication\echotrace
(let ((TASK_ID "echotrace-longterm")
      (CWD "D:\projects\Project\wx_comunication\echotrace")
      (OWNER "agent")
      (GOAL "基于 restore-v3.1.0 恢复源码工程，完成最小构建与图片密钥自动化研究")
      (INPUTS (list "agent_bridge/CONTEXT.md" "agent_bridge/TASKS.md" "agent_bridge/DECISIONS.md"))
      (ACTIONS (list "确认 Flutter SDK 并跑通 flutter pub get"
                     "输出图片解密最小链路"))
      (ACCEPTANCE (list "flutter 可用" "构建成功或给出明确失败原因"))
      (RETURN "构建结果 + 失败日志 + 下一步")
      (STOP (list "需要安装/卸载软件时先问用户"))
      (FORBIDDEN (list "不读取未授权微信数据")))
  (task-session TASK_ID CWD OWNER GOAL INPUTS ACTIONS ACCEPTANCE RETURN STOP FORBIDDEN))
