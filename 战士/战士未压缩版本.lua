-- 英勇打击,战斗怒吼使用怒气最低限额
NQ_YYDJ, NQ_ZZNH = 15, 10
-- 以下都是对于技能插槽编号
-- 判断冲锋是否在使用范围内
JN_CF, _ = IsActionInRange(13)
-- 判断血性狂暴冷却事件
JN_XXKB = GetActionCooldown(14)
-- 判断压制是否可以使用
JN_YZ = IsUsableAction(15)
-- 判断自动攻击是否在使用中
JN_ZDGJ = IsCurrentAction(24)
if not UnitIsFriend("player", "target") and not UnitIsDead("target") then
    if UnitAffectingCombat("player") == 1 then
        s_m = UnitMana("player")
        if JN_YZ then
            ChatFrame1:AddMessage(">>>>压制<<<<");
            CastSpellByName("压制")
        end
        if JN_XXKB == 0 then
            ChatFrame1:AddMessage(">>>>血性狂暴<<<<");
            CastSpellByName("血性狂暴")
        end
        if s_m >= NQ_ZZNH then
            if not IsBuffActive("战斗怒吼", "player") then
                ChatFrame1:AddMessage(">>>>使用战斗怒吼<<<<");
                CastSpellByName("战斗怒吼")
            else
                if not IsBuffActive("撕裂", "target") and UnitCreatureType("target") ~= "机械" then
                    ChatFrame1:AddMessage(">>>>使用撕裂<<<<");
                    CastSpellByName("撕裂")
                end
            end
        end
        if s_m >= NQ_YYDJ then
            ChatFrame1:AddMessage(">>>>使用英勇打击<<<<");
            CastSpellByName("英勇打击")
        end
    else
        if not JN_ZDGJ then
            AttackTarget()
        end
        if JN_CF == 1 then
            ChatFrame1:AddMessage(">>>>冲锋<<<<");
            CastSpellByName("冲锋")
        end
    end
end
