# @deepwhale-cn/dsh-cn-filing

[![dshfind 收录](https://dshfind.com/api/badge/feely0208/dsh-cn-filing?lang=zh)](https://dshfind.com/zh/plugins/feely0208/dsh-cn-filing)

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

---

## 深鲸网安守护系列（共 38 个）

> 一个插件做一件事。**安全问题是链式的** —— 配套用才完整。

**国内合规**（12）｜ [等保对照](https://github.com/feely0208/dsh-cn-mlps) · [日志留存](https://github.com/feely0208/dsh-cn-log-retention) · [备案公示](https://github.com/feely0208/dsh-cn-filing) · [用户同意](https://github.com/feely0208/dsh-consent-guard) · [个人信息权利](https://github.com/feely0208/dsh-data-rights) · [未成年人保护](https://github.com/feely0208/dsh-minor-guard) · [影响评估](https://github.com/feely0208/dsh-pipia) · [数据分类分级](https://github.com/feely0208/dsh-data-classify) · [算法备案](https://github.com/feely0208/dsh-algorithm-filing) · [数据出境](https://github.com/feely0208/dsh-cn-data-export) · [国密合规](https://github.com/feely0208/dsh-cn-crypto) · [AI 内容标识](https://github.com/feely0208/dsh-cn-ai-labeling)

**AI 与 Agent 治理**（6）｜ [AI 输出信任](https://github.com/feely0208/dsh-ai-output-trust) · [外部内容信任](https://github.com/feely0208/dsh-content-trust) · [MCP 安全](https://github.com/feely0208/dsh-mcp-audit) · [Agent 权限](https://github.com/feely0208/dsh-agent-scope) · [策略核对](https://github.com/feely0208/dsh-agent-policy) · [可疑指令](https://github.com/feely0208/dsh-phishing-guard)

**数据与凭据**（5）｜ [敏感数据](https://github.com/feely0208/dsh-data-scan) · [密钥轮换](https://github.com/feely0208/dsh-key-rotate) · [数据留存](https://github.com/feely0208/dsh-data-lifecycle) · [配置审计](https://github.com/feely0208/dsh-env-audit) · [密钥扫描](https://github.com/feely0208/dsh-secret-scan)

**供应链与构建**（5）｜ [开源许可](https://github.com/feely0208/dsh-license-guard) · [依赖投毒](https://github.com/feely0208/dsh-dep-audit) · [CI 安全](https://github.com/feely0208/dsh-ci-guard) · [工具审查](https://github.com/feely0208/dsh-tool-vet) · [物料清单](https://github.com/feely0208/dsh-sbom)

**权限与应急**（3）｜ [最小权限](https://github.com/feely0208/dsh-least-privilege) · [告警外发](https://github.com/feely0208/dsh-alert-relay) · [应急证据包](https://github.com/feely0208/dsh-incident-package)

**行业专项**（4）｜ [医疗行业专项](https://github.com/feely0208/dsh-industry-medical) · [教育行业专项](https://github.com/feely0208/dsh-industry-education) · [金融行业专项](https://github.com/feely0208/dsh-industry-finance) · [地方数据条例](https://github.com/feely0208/dsh-local-regulation)

**编排与交付**（3）｜ [一键体检](https://github.com/feely0208/dsh-guard-suite) · [改前改后复核](https://github.com/feely0208/dsh-fix-verify) · [合规可交付文档](https://github.com/feely0208/dsh-compliance-doc)

都在 DSH 插件市场（dsh-plugin.org）、npm 和 deepwhale.org.cn/guard.html 上。
