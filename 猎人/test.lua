-- TargetUnit("unit")选择指定的目标
-- ClearTarget()清楚已选中的目标
-- JL_ZDGJ 判断自动攻击距离
JN_ZDSJ = IsAutoRepeatAction(23)
JN_ZDGJ = IsCurrentAction(24)
JN_MQYJ = GetActionCooldown(13)
JN_ASSJ = GetActionCooldown(14)
s_m = UnitMana('player')
if UnitName("party1target") then
    if not IsBuffActive("猎人印记", "party1target") then
        ChatFrame1:AddMessage(">>>>使用猎人印记<<<<");
        CastSpellByName("猎人印记")
    end
    if not UnitIsFriend("party1", "party1target") then
        TargetUnit("party1target")
        JL_inRange = CheckInteractDistance("target", 2)
        if JL_inRange then
            FollowUnit('party1')
            if not JN_ZDGJ then
                UseAction(24);
            end
            if JN_MQYJ == 0 and s_m >= 15 then
                ChatFrame1:AddMessage(">>>>猛禽一击<<<<");
                CastSpellByName("猛禽一击")
            end
        else
            if not IsBuffActive("毒蛇钉刺", "party1target") then
                ChatFrame1:AddMessage(">>>>使用毒蛇钉刺<<<<");
                CastSpellByName("毒蛇钉刺")
            end
            if JN_ASSJ == 0 and s_m >= 25 then
                ChatFrame1:AddMessage(">>>>奥术射击<<<<");
                CastSpellByName("奥术射击")
            end
            if not JN_ZDSJ then
                UseAction(23);
            end
        end
    end
else
    FollowUnit('party1')
end
-- -------------------------------
JN_ZDSJ = IsAutoRepeatAction(23) JN_ZDGJ = IsCurrentAction(24) JN_MQYJ = GetActionCooldown(13) JN_ASSJ = GetActionCooldown(14) s_m = UnitMana('player') if UnitName("party1target") then if not IsBuffActive("猎人印记", "party1target") then ChatFrame1:AddMessage(">>>>使用猎人印记<<<<"); CastSpellByName("猎人印记") end if not UnitIsFriend("party1", "party1target") then TargetUnit("party1target") JL_inRange = CheckInteractDistance("target", 2) if JL_inRange then FollowUnit('party1') if not JN_ZDGJ then UseAction(24); end if JN_MQYJ == 0 and s_m >= 15 then ChatFrame1:AddMessage(">>>>猛禽一击<<<<"); CastSpellByName("猛禽一击") end else if JN_ASSJ == 0 and s_m >= 25 then ChatFrame1:AddMessage(">>>>奥术射击<<<<"); CastSpellByName("奥术射击") end if not JN_ZDSJ then UseAction(23); end end end else FollowUnit('party1') end
-- 2判断灵魂 复活
if RetrieveCorpse() then
    UnitIsGhost("player")
end
