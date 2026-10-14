# @deepwhale-cn/dsh-cn-filing

**备案公示检查** —— 查应用里有没有 ICP 备案号、APP 备案号、隐私政策入口、运营者信息。

## 不装它会怎样

你的网站/App 上线了，功能没问题，但**页脚只有一行 `© 2026 Demo Project`**。

检查来了，问的第一个问题是：**「备案号呢？」**

```
《互联网信息服务管理办法》第十二条
  —— 应在网站主页面标明备案编号

工信部信管〔2023〕105号
  —— 2023 年起 APP 也需要单独备案（以前只有网站要）

《个人信息保护法》第十七条
  —— 应以显著方式告知；「未公开收集使用规则」是明确的违规行为
```

**这些都是可以提前自查的**，而不是等被通知整改。

## 关键词
**关键词**：ICP备案 · APP备案 · 应用备案 · 备案号 · 备案编号 · 隐私政策 · 用户协议 · 运营者信息
**Keywords**: ICP filing · app filing · filing number · privacy policy · China compliance

## 它查什么

| 级别 | 内容 |
|---|---|
| 🔴 高 | 找不到 ICP 备案号 · APP 备案号 · 隐私政策入口 |
| 🟡 中 | 找不到运营者主体信息 |

## 一条规则是「条件适用」的

**`FILING-NO-APP` 只在检测到移动端项目时运行**（识别标志：uniapp / react-native / flutter / AndroidManifest…）。

纯 Web 项目跑这条就是误报 —— 这一条我们踩过。不适用时会在报告里记为「未运行」，**不算已检查**（防止假绿）。

## 安装

```bash
dsh plugin --profile web add @deepwhale-cn/dsh-cn-filing
# 或纯 CLI
npx @deepwhale-cn/dsh-cn-filing
```

![dsh-cn-filing 检查报告示例](https://www.deepwhale.org.cn/plugin-assets/dsh-cn-filing/report.png)

![dsh-cn-filing 演示模式输出](https://www.deepwhale.org.cn/plugin-assets/dsh-cn-filing/demo.png)

![dsh-cn-filing 规则与依据](https://www.deepwhale.org.cn/plugin-assets/dsh-cn-filing/rules.png)

## 用法

```bash
dsh-cn-filing --demo
dsh-cn-filing --list-rules
dsh-cn-filing --html r.html
```

## 边界

- **只查「有没有写」，不查「备案是否真实有效」** —— 备案号的真伪要去工信部系统查，本工具不联网。
- **不覆盖小程序备案**（也有单独要求），识别标志可能不全。
- **absence 类规则是弱信号** —— 备案信息可能由部署层/模板统一渲染，不从仓库代码走。
  报出来是**提示你确认**，不是判定。
- **格式校验有限** —— 能识别 `ICP备` / `APP备案` 等关键词，但不严格校验号码格式。

本插件是一个工具。使用者必须遵守所在地区法律法规，**对使用本项目造成的任何后果自行承担责任。**

## License

MIT © 深鲸 DeepWhale
