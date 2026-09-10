---
name: user-agent-collaboration
description: 用户与 Agent 共同排布任务的协作技能。用 TaskSpec + LISP 风格提示词，把任务拆成“一个负责人 + 一个工作目录 + 一个可验证结果”，并从用户注意力出发，让聊天界面优先显示“现在轮到用户做什么”。适用于长期多会话分工、Agent 给用户派活、用户给 Agent 派活、任务矩阵与计划输出。
version: "0.1.0"
---

# 用户与 Agent 协作任务分工

## 1. 何时使用

- 一个目标需要用户和 Agent 共同完成；
- 需要创建多个长期会话，各自负责一个工作区；
- Agent 要给用户分配可执行任务；
- 用户要给 Agent 分配可验证任务；
- 计划太长，用户看不清“从哪儿开始是我要做的”。

## 2. 最小可验证单元

每个任务必须满足：

1. **一个负责人**：user / agent / shared；
2. **一个工作目录**：绝对路径，不允许“当前目录”含糊；
3. **一个可验证结果**：完成后能检查、能回传证据；
4. **一个下一动作**：用户任务一次只显示一个可见动作。

## 3. TaskSpec 字段

| 字段 | 含义 |
|---|---|
| id | kebab-case 任务 ID |
| owner | user / agent / shared |
| cwd | 工作目录绝对路径 |
| goal | 完成后世界发生的可检验变化 |
| inputs | 必读文件或 URL |
| actions | 每项一个可验证动作 |
| acceptance | 可勾选验收条件 |
| return | 完成后回传的证据对象 |
| stop | 触发立即停止的条件 |
| forbidden | 禁止事项 |

## 4. LISP 风格通用函数

```lisp
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
```

完整模板见 `templates/task-session.lisp`。

## 5. 实例化赋值

```lisp
(let ((TASK_ID "collector-longterm")
      (CWD "D:\data\...\wechat_mp_article_collector")
      (OWNER "agent")
      (GOAL "维护公众号采集、T1/T5/T6、HTML 阅读库与 Skill")
      (INPUTS (list "AGENTS.md" "AGENT.md" "任务进度.md" "README.md" "SKILL.md"))
      (ACTIONS (list "盘点 T5 剩余 no_js_content" "运行 T6 端到端验证"))
      (ACCEPTANCE (list "每个失败项有文件级证据" "任务进度与磁盘一致"))
      (RETURN "结果摘要 + 变更路径 + 失败清单")
      (STOP (list "需要删除/移动/归档时先问用户"))
      (FORBIDDEN (list "不绕过登录")))
  (task-session TASK_ID CWD OWNER GOAL INPUTS ACTIONS ACCEPTANCE RETURN STOP FORBIDDEN))
```

## 6. 用户注意力优先聊天范式

输出消息时固定分成：

```text
👤 给你的任务
🤖 我继续做的事
```

用户区一次只显示：

- 现在动作；
- 为什么现在；
- 打开资源；
- 做完回传。

背景、完整步骤、风险放到 TaskSpec 详情或折叠区。

## 7. TOC 契约

长回复必须给用户可跳转目录：

```lisp
(:toc
  :position "both"
  :source "headings"
  :numbering "preserve"
  :anchor-mode "plugin"
  :fallback "none")
```

- `source: headings`：目录从真实标题生成，不手工重编号；
- `numbering: preserve`：正文和目录编号一致；
- `anchor-mode: plugin`：由插件渲染跳转，不手写脆弱锚点。

## 8. 执行纪律

- 任何修改前先展示命令、说明用途、取得用户同意；
- 任一步失败立即停止，不盲目尝试替代方案；
- 每步报告结果；
- 不把敏感凭据写入仓库。
