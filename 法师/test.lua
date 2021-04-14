-- TargetUnit("unit")选择指定的目标
-- ClearTarget()清楚已选中的目标
-- 火焰冲击放在第二排第一个
JN_ZDGJ = IsCurrentAction(24)
JN_HYCJ = GetActionCooldown(13)
s_m = UnitMana('player')
if UnitName('party1target') then
    if not UnitIsFriend('party1', 'party1target') then
        TargetUnit('party1target')
        if IsBuffActive('火球术', 'party1target') and JN_HYCJ == 0 and s_m >= 40 then
            ChatFrame1:AddMessage('>>>>火焰冲击<<<<')
            CastSpellByName('火焰冲击')
        end
        if s_m >= 45 then
            ChatFrame1:AddMessage('>>>>火球术<<<<')
            CastSpellByName('火球术')
        end
        if not JN_ZDGJ then
            TargetUnit('party1target')
            AttackTarget()
        end
    end
else
    FollowUnit('party1')
end

-- 2判断灵魂 复活
if RetrieveCorpse() then
    UnitIsGhost('player')
end
-- 3队员buff判断,奥术智慧,寒冰甲
if not IsBuffActive('霜甲术', 'player') then ChatFrame1:AddMessage('>>>>自己=>霜甲术<<<<') CastSpellByName('霜甲术') end if not IsBuffActive('奥术智慧', 'player') then ClearTarget() ChatFrame1:AddMessage('>>>>自己=>奥术智慧<<<<') CastSpellByName('奥术智慧') end for i = 1, GetNumPartyMembers() do if not IsBuffActive('奥术智慧', 'party' .. i) then TargetUnit('party' .. i) ChatFrame1:AddMessage('>>>>队友=>奥术智慧<<<<') CastSpellByName('奥术智慧') break end end
