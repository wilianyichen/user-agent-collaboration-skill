;; 会话名：personality-research
;; 工作目录：D:\projects\PersonalityResearch
(let ((TASK_ID "personality-research")
      (CWD "D:\projects\PersonalityResearch")
      (OWNER "agent")
      (GOAL "继续小肥鱼研究，并基于 00_INPUT_PACKAGE.md 构建可溯源的人格功能底层抽象模型")
      (INPUTS (list "README.md" "小肥鱼人格研究/README.md" "人格功能底层建模/00_INPUT_PACKAGE.md"))
      (ACTIONS (list "先输出功能-生理链路素材卡"
                     "再输出冲突图谱与模型草案"))
      (ACCEPTANCE (list "不硬编参数" "每个构件可溯源" "标出知识缺口"))
      (RETURN "素材卡 + 冲突图谱 + 模型草案 + 缺口清单")
      (STOP (list "知识库材料不足时先补材料，不硬编"))
      (FORBIDDEN (list "不把讲者通俗类比当学术结论")))
  (task-session TASK_ID CWD OWNER GOAL INPUTS ACTIONS ACCEPTANCE RETURN STOP FORBIDDEN))
