# LianMarkup

受到 `markdown` 格式的启发, 决定做一个自己写起来舒服的东西

**LianMarkup** 二进制文件以 `.ly` 或 `.lian` 为后缀

---

## 要做什么?

我希望这个语法格式最先用到我的Blog页面中, 也就是这两个项目:

1) [YukiLog](https://github.com/Yueosa/YukiLog)

所以一定要先支持渲染为 HTML + CSS + JS 的格式

* `HTML`: 负责将文本解析为容器对象
* `CSS`: 负责给标记语法画样式
* `JS`: 负责处理一些复杂的显示逻辑

产物可以被 V8 引擎渲染, 理论上可以嵌入任何网页中显示

于是我开始思考这两个问题:

1) 是不是应该先定义几个语法和规范?
2) 是不是应该先思考一下解析器怎么写?

---

## 怎么做呢?

我最开始打算使用 `rust` 来写这个解析器, 毕竟是我比较熟悉的语言

不过考虑要用到前端的话, 其实 `typescripts` 是更有优势的, 他可以直接被 `nodejs` 运行, 后续变成 `npm` 包也方便

然后我想到了毕业设计里做的东西, 于是开始调查去年写下的代码: [Lian-MCP-LLM-Agent.mylib.kit](https://github.com/Yueosa/Lian-MCP-LLM-Agent/tree/main/mylib/kit)

从文档里得到的线索来看, 我当时定义了这些东西:

* Lstack 标准栈
* Lfsm 通用有限状态机
* Lpda 下推自动机

* Ltokenizer 通用分词器
* Lparser 通用解析器

> 然后我有了这样的思考: [如何读取文本流.md](./docs/如何读取文本流.md)

> 语法规范初稿: [语法规范.md](./docs/语法规范.md)

和 YukiLog 侧对齐后定稿: 解析器用 `rust` 实现为 crate (纯函数 `parse(&str) -> Document`, 无 IO), 放在后端渲染期解析, 前端只消费产物, 详见 [产物契约.md](./docs/产物契约.md)

## 文档地图

* [如何读取文本流.md](./docs/如何读取文本流.md) —— 字节流解析思路 (为什么)
* [语法规范.md](./docs/语法规范.md) —— 完整语法定义 (是什么)
* [语法速查.md](./docs/语法速查.md) —— 一页速查 (怎么写)
* [产物契约.md](./docs/产物契约.md) —— 与 YukiLog 的接口 (怎么对接)
* [解析器架构.md](./docs/解析器架构.md) —— 实现层面的设计 (怎么实现的)
* [设计决定.md](./docs/设计决定.md) —— 关键取舍的记录 (当时怎么想的)

