#!/bin/bash
set -uo pipefail
cd "$(dirname "$0")/.."
PASS=0; FAIL=0
ok(){ echo "  ✅ $1"; PASS=$((PASS+1)); }
bad(){ echo "  ❌ $1"; FAIL=$((FAIL+1)); }
echo ""; echo "  @deepwhale-cn/dsh-cn-filing · 双向验证"
echo "  ────────────────────────────────────────────────"
J=$(node bin/cli.mjs --root tests/fixtures/fail/demo-project --json 2>&1)
for rid in FILING-NO-ICP FILING-NO-PRIVACY-ENTRY FILING-NO-OPERATOR; do
  c=$(echo "$J" | python3 -c "
import json,sys; d=json.load(sys.stdin)
print(len([f for f in d['findings'] if f['ruleId']=='$rid']))" 2>/dev/null)
  [ "${c:-0}" -gt 0 ] && ok "$rid 报出" || bad "$rid 未报出"
done
M=$(node bin/cli.mjs --root tests/fixtures/pass/clean-project --quiet 2>&1 | grep -oE '^[0-9]+' | head -1)
[ "${M:-1}" = "0" ] && ok "合规样本 0 命中" || bad "误报 ${M} 条"
echo ""; echo "  【条件规则】APP 备案规则在纯 Web 项目上必须【不运行】，而不是报错"
NA=$(echo "$J" | python3 -c "
import json,sys; d=json.load(sys.stdin)
print(','.join(d.get('notApplicable') or []))" 2>/dev/null)
echo "$NA" | grep -q "FILING-NO-APP" && ok "纯 Web 项目：FILING-NO-APP 判为不适用（$NA）" || bad "条件规则没生效（notApplicable=$NA）"
echo ""; echo "  【溯源】每条规则必须带 source 且引法条"
python3 - <<'PY' && ok "全部规则均有 source 且引法条" || bad "有规则缺 source/法条"
import json,glob,sys
for f in glob.glob('rules/*.json'):
    r=json.load(open(f,encoding='utf-8')); s=r.get('source','')
    if not s: print('缺:',r.get('id'),file=sys.stderr); sys.exit(1)
    if '第' not in s and '号' not in s: print('未引法条:',r.get('id'),file=sys.stderr); sys.exit(1)
PY
echo ""; echo "  ────────────────────────────────────────────────"
echo "  通过 $PASS · 失败 $FAIL"; echo ""
[ "$FAIL" -eq 0 ] || exit 1
