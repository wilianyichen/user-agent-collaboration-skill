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
