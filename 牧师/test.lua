-- TargetUnit("unit")选择指定的目标
-- ClearTarget()清楚已选中的目标
JN_ZDGJ = IsCurrentAction(24)
s_m = UnitMana('player')
if UnitName('party1target') then
    if not UnitIsFriend('party1', 'party1target') then
        for i = 1, GetNumPartyMembers() do
            ChatFrame1:AddMessage('开始循环找目标')
            bf_h = math.floor(UnitHealth('party' .. i) / UnitHealthMax('party' .. i) * 100)
            bf_s_h = math.floor(UnitHealth('player') / UnitHealthMax('player') * 100)
            ChatFrame1:AddMessage('目标' .. i .. ':' .. bf_h .. '自己' .. bf_s_h)
            if bf_h < 50 or bf_s_h < 50 then
                if bf_s_h < 50 then
                    ClearTarget()
                    ChatFrame1:AddMessage('>>>>次级治疗术<<<<')
                    CastSpellByName('次级治疗术')
                    break
                end
                TargetUnit('party' .. i)
                ChatFrame1:AddMessage('>>>>次级治疗术<<<<')
                CastSpellByName('次级治疗术')
                break
            end
        end
        if not IsBuffActive('暗言术：痛', 'party1target') and s_m > 100 then
            TargetUnit('party1target')
            ChatFrame1:AddMessage('>>>>使用暗言术：痛<<<<')
            CastSpellByName('暗言术：痛')
        end
    end
else
    FollowUnit('party1')
end
-- -----------------------
JN_ZDGJ = IsCurrentAction(24)
s_m = UnitMana('player')
if UnitName('party1target') then
    if not UnitIsFriend('party1', 'party1target') then
        for i = 1, GetNumPartyMembers() do
            bf_h = math.floor(UnitHealth('party' .. i) / UnitHealthMax('party' .. i) * 100)
            bf_s_h = math.floor(UnitHealth('player') / UnitHealthMax('player') * 100)
            if bf_h < 50 or bf_s_h < 50 then
                if bf_s_h < 50 then
                    ClearTarget()
                    ChatFrame1:AddMessage('>>>>次级治疗术<<<<')
                    CastSpellByName('次级治疗术')
                    break
                end
                TargetUnit('party' .. i)
                ChatFrame1:AddMessage('>>>>次级治疗术<<<<')
                CastSpellByName('次级治疗术')
                break
            end
        end
        if not JN_ZDGJ then
            TargetUnit('party1target')
            AttackTarget()
        end
        if not IsBuffActive('暗言术：痛', 'party1target') and s_m > 100 then
            TargetUnit('party1target')
            ChatFrame1:AddMessage('>>>>使用暗言术：痛<<<<')
            CastSpellByName('暗言术：痛')
        end
        s_m = math.floor(UnitMana('player') / UnitManaMax('player') * 100)
        if s_m > 50 then
            TargetUnit('party1target')
            ChatFrame1:AddMessage('>>>>惩击<<<<')
            CastSpellByName('惩击')
        end
    end
else
    FollowUnit('party1')
end
-- 攻击版本
-- for循环后去掉的内容,取消释放攻击技能
-- if not JN_ZDGJ then
--     TargetUnit("party1target")
--     AttackTarget()
-- else
--     s_m = math.floor(UnitMana('player') / UnitManaMax('player') * 100)
--     if s_m > 50 then
--         TargetUnit("party1target")
--         ChatFrame1:AddMessage('>>>>惩击<<<<')
--         CastSpellByName('惩击')
--     end
-- end
-- 循环判断BUFF宏
if not IsBuffActive('真言术：韧', 'player') then
    ClearTarget()
    ChatFrame1:AddMessage('>>>>自己=>真言术：韧<<<<')
    CastSpellByName('真言术：韧')
end
for i = 1, GetNumPartyMembers() do
    if not IsBuffActive('真言术：韧', 'party' .. i) then
        TargetUnit('party' .. i)
        ChatFrame1:AddMessage('>>>>队友=>真言术：韧<<<<')
        CastSpellByName('真言术：韧')
        break
    end
end
-- 判断灵魂 复活
if RetrieveCorpse() then
    UnitIsGhost('player')
end
