import { createPlugin, pkgRootFrom } from '@deepwhale-cn/dsh-guard-core/plugin';

export const { name, inject, apply } = createPlugin({
  name: 'cn-filing',
  pkgRoot: pkgRootFrom(import.meta.url),
  skillFile: 'skill/cn-filing.md',
  binFile: 'bin/cli.mjs',
  description: '查应用里有没有展示 ICP/APP 备案号、隐私政策入口、运营者信息 —— 都是法定义务',
  whenToUse: 'TODO：写清什么时候该用（用户会说的话也列上）',
});
