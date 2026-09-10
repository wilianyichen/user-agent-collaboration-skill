;; 会话名：collector-longterm
;; 工作目录：D:\data\BaiduSyncdisk\knowledge-lab\_工作区\wechat_mp_article_collector
(let ((TASK_ID "collector-longterm")
      (CWD "D:\data\BaiduSyncdisk\knowledge-lab\_工作区\wechat_mp_article_collector")
      (OWNER "agent")
      (GOAL "维护公众号采集、T1/T5/T6、HTML 阅读库与 Skill，保持任务进度与磁盘一致")
      (INPUTS (list "AGENTS.md" "AGENT.md" "任务进度.md" "README.md" "SKILL.md"))
      (ACTIONS (list "盘点 T5 剩余 13 篇 no_js_content，分类为可补抓或永久例外"
                     "运行 T6 真实混合 URL 端到端验证"))
      (ACCEPTANCE (list "每个失败项有文件级证据与原因"
                        "任务进度.md 与磁盘状态一致"))
      (RETURN "结果摘要 + 变更路径 + 失败清单")
      (STOP (list "需要删除/移动/归档时先问用户"
                  "遇到微信验证码/登录要求时立即停止"))
      (FORBIDDEN (list "不绕过登录" "不安装未授权第三方工具")))
  (task-session TASK_ID CWD OWNER GOAL INPUTS ACTIONS ACCEPTANCE RETURN STOP FORBIDDEN))
