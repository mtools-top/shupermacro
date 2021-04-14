-- 选中指定的目标,用name
TargetByName('Goodman')
-- 选中对象作为目标
TargetUnit('party1')
-- 判断指定单位是否在战斗状态
ChatFrame1:AddMessage(UnitAffectingCombat('party1'))

-- 获取生命值
ChatFrame1:AddMessage(UnitHealth('target') / UnitHealthMax('target') .. '=>>' ..
                          math.floor(UnitHealth('target') / UnitHealthMax('target') * 100))
-- 简单判断生命并加血
-- 首先判断目标是否在战斗中
FollowUnit('party1')
if UnitAffectingCombat('party1') then
    h = math.floor(UnitHealth('party1') / UnitHealthMax('party1') * 100)
    if h < 50 then
        TargetUnit('party1')
        ChatFrame1:AddMessage('>>>>次级治疗术<<<<')
        CastSpellByName('次级治疗术')
    end
end
