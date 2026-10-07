# LianMarkup

恋的自研标记语言（`.ly`）与 Rust 解析器 crate。YukiLog 博客的正文语法。

## 仓库关系

- 本仓库是语法与解析器的**唯一修改点**；`../YukiLog/lianmarkup/` 是内嵌副本，只做同步
- 同步 = 把本仓库 `src/*.rs`、`tests/*.rs`、`examples/first-post.ly`、`docs/*.md`
  复制进 YukiLog 的 `lianmarkup/`，保持 `diff -rq` 干净

## 结构

- `src/`：lib.rs（入口 parse + Document）、block.rs（块级）、inline.rs（行内）、escape.rs
- `tests/`：黑盒测试，全走公开 `parse` API（syntax.rs 语法矩阵、first_post.rs 端到端）
- `examples/`：first-post.ly（语法展示页，生产博客同名文章的母本）、render.rs（离线渲染）
- `docs/`：语法规范.md（权威定义）、语法速查.md、产物契约.md、设计决定.md（D 系列）、
  解析器架构.md、如何读取文本流.md（早期设想）

## 硬规则

- 改完必须 `cargo test` 全绿 + `cargo clippy --all-targets` 零警告
- 新语法/语法变更：解析器 + 测试 + 规范 + 速查 + （必要时）设计决定新 D 条目，一次做齐
- 解析器**永不报错**：任何无法匹配的内容回退为正文段落
- 行首关键字必须带空格；行内定界符必须成对且内容非空；原样区域（`` ` ``、`~~~`）优先于转义
- 语法饥饿比语法肥胖好：没有真实场景的特性先记进规范 0x09 待定区，不写实现

## 离线验证

```bash
cargo run --example render -- examples/first-post.ly   # 渲染示例文章
cargo test                                              # 全量测试
```
