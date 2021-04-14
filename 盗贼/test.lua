-- TargetUnit("unit")选择指定的目标
-- ClearTarget()清楚已选中的目标
JN_ZDGJ = IsCurrentAction(24) FollowUnit('party1') if UnitAffectingCombat('party1') then s_m = UnitMana('player') TargetUnit("party1target") if GetComboPoints() >= 4 then ChatFrame1:AddMessage('>>>>使用剔骨<<<<') CastSpellByName('剔骨') end if s_m >= 45 then ChatFrame1:AddMessage('>>>>使用邪恶攻击<<<<') CastSpellByName('邪恶攻击') end if not JN_ZDGJ then TargetUnit('party1target') AttackTarget() end end

-- 2判断灵魂 复活
if RetrieveCorpse() then
    UnitIsGhost('player')
end
