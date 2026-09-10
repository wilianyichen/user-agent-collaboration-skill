# 与 DSH WebUI 插件结合

推荐插件：[statem-li/dsh-webui](https://github.com/statem-li/dsh-webui)

## 为什么

该插件的 Markdown 渲染已经包含：

- 标题锚点注入；
- 悬浮顶部 TOC；
- `scrollToHeading`：只滚动最近的滚动容器，不整页跳动。

## 建议启用的注意力优化

1. **底部 TOC**  
   长回复结束后，用户直接在底部目录选择下一节，而不是从头滚动。
2. **`#fragment` 可跳转**  
   允许手写/生成的 `#锚点` 与插件 TOC 使用同一套滚动逻辑。
3. **编号 preserve**  
   目录直接使用真实 headings，避免手工重编号导致对不上。
4. **未来：`tocFilter: userTasks`**  
   只显示 `## 👤 给你的任务` 下的标题，进一步降低注意力噪音。

## PR 方向

对 `DshLinkNode` 增加片段链接支持；对 `MarkstreamMarkdown` 增加 `tocPosition: 'top' | 'bottom' | 'both'`。

## 关联 PR

- https://github.com/Kr-ATG/dsh-webui/pull/1

## 设计 2：首尾目录括号与配对

推荐在 `both` 模式下使用：

- 顶部：`⌜ 开头目录 · #hash`
- 底部：`⌟ 结尾目录 · #hash`
- 顶部默认折叠，底部默认展开；
- 只有主 assistant 正文显示这对目录，工具详情/预览/团队 HUD 不自动显示。

这样用户可以一眼分辨：

- 哪个目录属于这段正文的开头；
- 哪个目录属于这段正文的结尾；
- 多段内容同时出现时，`#hash` 相同的两个目录是一对。

## 设计 3：树形目录

配合 DSH WebUI 的 TOC 树形增强：

- h1～h6 自动构建层级树；
- 默认展开前两层；
- 有子标题的节点显示折叠箭头；
- 箭头折叠、标题跳转，职责分离；
- 顶部和底部 TOC 各自独立折叠状态；
- `maxHeight = 520px`，目录内滚动；
- 不做缩进参考线，不做 VSCode 式当前项高亮和键盘导航。

## 设计 4：红绿圆点折叠

- 绿色填充圆点：已展开；
- 红色填充圆点：已折叠；
- 点击区域 20px，圆点直径 12px；
- 圆点只折叠/展开，标题文字只跳转。
