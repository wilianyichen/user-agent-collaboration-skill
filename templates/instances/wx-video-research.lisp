;; 会话名：wx-video-research
;; 工作目录：D:\data\BaiduSyncdisk\knowledge-lab\_工作区\wx_video_research
(let ((TASK_ID "wx-video-research")
      (CWD "D:\data\BaiduSyncdisk\knowledge-lab\_工作区\wx_video_research")
      (OWNER "agent")
      (GOAL "验证视频号路径 A，管理隔离 VM 与合规边界")
      (INPUTS (list "README.md" "T3_视频号探测报告.md" "T3_视频号下载路径A_环境预检.md"))
      (ACTIONS (list "检查 F:\VMs\Win11-VideoTest 与 VMware Tools 状态"
                     "决定修复、重装或放弃"))
      (ACCEPTANCE (list "VM 可用或明确说明不可用原因"))
      (RETURN "环境检查结果 + 下一步动作")
      (STOP (list "遇到登录/验证码/私密内容立即停止"))
      (FORBIDDEN (list "不绕过平台限制")))
  (task-session TASK_ID CWD OWNER GOAL INPUTS ACTIONS ACCEPTANCE RETURN STOP FORBIDDEN))
