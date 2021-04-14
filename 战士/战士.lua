-- 战斗中,
-- 压制,血腥狂暴能放就放
-- 怒气>=10无战斗怒吼放,无撕裂放
-- 怒气>=30英勇打击
-- 战斗外判断冲锋是否可以使用,能用就用
-- 英勇打击,战斗怒吼使用怒气最低限额
NQ_YYDJ, NQ_ZZNH = 15, 10 JN_CF, _ = IsActionInRange(13) JN_XXKB = GetActionCooldown(14) JN_YZ = IsUsableAction(15) JN_ZDGJ = IsCurrentAction(24) if not UnitIsFriend("player", "target") and not UnitIsDead("target") then if UnitAffectingCombat("player") == 1 then if JN_YZ then ChatFrame1:AddMessage(">>>>压制<<<<"); CastSpellByName("压制") end if JN_XXKB == 0 then ChatFrame1:AddMessage(">>>>血性狂暴<<<<"); CastSpellByName("血性狂暴") end if UnitMana("player") >= NQ_ZZNH then if not IsBuffActive("战斗怒吼", "player") then ChatFrame1:AddMessage(">>>>使用战斗怒吼<<<<"); CastSpellByName("战斗怒吼") else if not IsBuffActive("撕裂", "target") and UnitCreatureType("target") ~= "机械" then ChatFrame1:AddMessage(">>>>使用撕裂<<<<"); CastSpellByName("撕裂") end end end if UnitMana("player") >= NQ_YYDJ then ChatFrame1:AddMessage(">>>>使用英勇打击<<<<"); CastSpellByName("英勇打击") end else if not JN_ZDGJ then AttackTarget() end if JN_CF == 1 then ChatFrame1:AddMessage(">>>>冲锋<<<<"); CastSpellByName("冲锋") end end end
-- 获取技能id
local s, i, n = "撕裂", 1; while 1 do n = GetSpellName(i, "spell"); if n then if strfind(n, s) then ChatFrame1:AddMessage(i); break end i = i + 1; else break end end
-- 判断技能是否在距离内??
ChangeActionBarPage() if IsActionInRange(3)==1 then SendChatMessage("OK", "SAY") else SendChatMessage(tostring(IsActionInRange(3)), "SAY") end
-- 查看怒气,number
ChatFrame1:AddMessage(UnitMana("player"), "SAY")
-- 判断是否战斗中,number
ChatFrame1:AddMessage(tostring(UnitAffectingCombat("player"))) 
-- 返回目标生命百分百
ChatFrame1:AddMessage(UnitHealth("target"))
-- 判断指定编号快捷键当前是否可用
ChatFrame1:AddMessage(tostring(IsUsableAction(61)[1]))
-- 判断指定编号快捷键是否是一个自动攻击技能（如魔杖射击）
ChatFrame1:AddMessage(tostring(IsAutoRepeatAction(i))..i)
-- 不会取消自动攻击
if (IsCurrentAction(1) == nil) then
    AttackTarget()
end