# user-agent-collaboration-skill

用户与 Agent 共同分工的 **TaskSpec + LISP 风格提示词** 范式。

这个仓库解决的问题不是“怎么让 Agent 多干活”，而是：

- 怎么把一件事讲清楚，让 Agent 和用户都能执行；
- 怎么把颗粒度定在“一个负责人 + 一个工作目录 + 一个可验证结果”；
- 怎么从用户注意力出发，让聊天界面先回答“现在轮到我做什么”。

## 核心结构

```text
通用任务流程提示词（函数）
    +
每个新会话的变量赋值（实例）
    =
一段可独立复制、可直接粘贴到新会话的 TaskSpec
```

## 为什么用 LISP 风格

LISP 的 S-expression 天然适合表达“函数 + 参数”：

- 字段名和值一眼可见；
- 每段实例可以单独复制；
- 可以同时承载人类可读语义和 Agent 可解析结构；
- 不要求真的运行 Lisp，只把它当作结构化任务规格。

## 文件结构

```text
.
├─ SKILL.md                         # 完整技能说明
├─ templates/
│  ├─ task-session.lisp             # 通用任务会话函数
│  └─ instances/                    # 可复制的实例化任务
├─ docs/
│  ├─ attention-first-chat.md       # 用户注意力优先的聊天范式
│  └─ dsh-webui-integration.md      # 与 DSH WebUI 插件结合
└─ LICENSE
```

## 使用顺序

```text
① 选择或新建工作目录
② 在 DSH 中新建会话
③ 粘贴对应的实例化 LISP 任务块
```

每个实例块外都显式标注：

```text
会话名：collector-longterm
工作目录：D:\...
```

## DSH WebUI 推荐组合

建议配合：

- [statem-li/dsh-webui](https://github.com/statem-li/dsh-webui)

启用/扩展其中的 Markdown TOC 能力：

- 顶部目录：快速扫描；
- 底部目录：长回复结束后的收束导航；
- `#fragment` 点击跳转：用户的注意力可以直接落在“我的任务”或任意章节；
- 未来可扩展 `tocFilter: userTasks`，只显示 `## 👤 给你的任务` 下的标题。

## License

MIT

## 关联 PR

- 上游 DSH WebUI 插件（当前仓库：Kr-ATG/dsh-webui）：
  - PR #1：`https://github.com/Kr-ATG/dsh-webui/pull/1`
  - 内容：`#fragment` 片段链接跳转 + 可配置底部 TOC。
