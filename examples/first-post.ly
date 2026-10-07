---
title: LianMarkup 语法一览
slug: hello-lianmarkup
tags: [lianmarkup, 博客, 标记语言]
---

# LianMarkup 语法一览

@toc depth=2

这个博客的文章使用 **LianMarkup**[^一门我自研的标记语言, 文件后缀 .ly, 语法规范和解析器都在 [GitHub](https://github.com/Yueosa/LianMarkup)] 书写。本页是全部语法的实际渲染演示, 每个格子都是 "写法 → 效果"。

## 标题

~~~text
## 二级标题 {#custom-id}
~~~

- `#` 后**必须有空格**, 否则视为正文
- 标题自动获得 `h-N` 锚点, 用 `{#custom-id}` 可覆盖
- 开头那行 `@toc depth=2` 让左侧目录自动生成

## 文本样式

~~~text
**加粗** *斜体* ***粗斜体*** ~~删除线~~ ==高亮== `行内代码`
~~~

**加粗** *斜体* ***粗斜体*** ~~删除线~~ ==高亮== `行内代码`

不配对的符号自动回退为文本: `2*3=6` 不是斜体。需要字面量时用 \ 转义: \*\*这不是加粗\*\*

## 链接与图片

~~~text
[链接文字](https://github.com/Yueosa/LianMarkup)
![竖图示例](https://picsum.photos/400/600){width=40% group=demo}
~~~

[链接文字](https://github.com/Yueosa/LianMarkup)

![竖图示例](https://picsum.photos/400/600){width=40% group=demo}

图片支持可选属性: `width` 控制宽度 (竖图友好), `group` 相同的图片在灯箱里归为一组。

## 列表

~~~text
- 无序项
	- TAB 缩进嵌套
1. 有序项
- [ ] 待办
- [x] 完成
~~~

- 无序项
	- TAB 缩进嵌套
1. 有序项
- [ ] 待办
- [x] 完成

## 引用与分割线

~~~text
> 引用块, 空行结束。

---
~~~

> 引用块, 空行结束。

上面这条横线就是 `---`。

## Callout 家族

五种, 首行是标题, 空行结束:

>? 疑问块 `>?`
>存放一个问题, 以及它的展开讨论。

>! 警告块 `>!`
>必须避开的坑, 红色醒目。

>+ 技巧块 `>+`
>可以偷懒的小技巧。

>x 反例块 `>x`
>不要这样做的示范。

>i 信息块 `>i`
>中性的补充说明。

## 折叠块

两种写法: TAB 缩进作用域, 或 `<<<` 显式配对。`>>>+` 默认展开:

~~~text
>>> 点我展开 (缩进模式)
	这行属于折叠块。
	缩进回退即结束。

>>>+ 我默认展开 (配对模式)
用 <<< 结束。
<<<
~~~

>>> 点我展开 (缩进模式)
	这行属于折叠块。
	缩进回退即结束。

>>>+ 我默认展开 (配对模式)
用 `<<<` 结束。
<<<

## 旁注

正文里的上标[^就是这样, 备注内容就地书写]是旁注。

~~~text
正文里的上标[^就是这样, 备注内容就地书写]是旁注。
~~~

桌面端显示在正文右侧, 移动端点上标展开。

## 代码块

~~~text
```rust
fn main() {
    println!("你好, LianMarkup!");
}
```
~~~

```rust
fn main() {
    println!("你好, LianMarkup!");
}
```

`mermaid` 语言标记会原样透传给前端渲染图表:

~~~text
```mermaid
flowchart LR
    A[作者] -->|写 .ly| B[解析器]
    B -->|输出| C[HTML + TOC + 旁注]
```
~~~

```mermaid
flowchart LR
    A[作者] -->|写 .ly| B[解析器]
    B -->|输出| C[HTML + TOC + 旁注]
```

## 原样块

三个波浪号包裹的内容零解析, 本页所有 "写法" 示例都靠它显示:

```text
~~~
这里面 **不会加粗**, # 也不是标题
~~~
```

## 小玩具

剧透 (点击显示): 凶手其实是||管家||。

行内公式 $E=mc^2$, 块级公式:

$$
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
$$

注音: {漢字|かんじ} 和 {汉字|hàn zì}。

## 表格

| 语法 | 用途 |
|-|-|
| `@toc` | 目录指令 |
| `[^...]` | 旁注 |
| `>>>` | 折叠块 |
| `>?` 等 | callout |

---

完整定义见 [语法规范](https://github.com/Yueosa/LianMarkup/blob/main/docs/语法规范.md), 一页速查见 [语法速查](https://github.com/Yueosa/LianMarkup/blob/main/docs/语法速查.md)。
