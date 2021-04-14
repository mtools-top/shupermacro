-- 1.1==首先确定动作栏编号,通过创建一个宏放到动作栏
local slotnum = 1;
while (slotnum <= 120) do
    if GetActionText(slotnum) then
        ChatFrame1:AddMessage(slotnum)
        ChatFrame1:AddMessage(tostring(GetActionText(slotnum)))
        ChatFrame1:AddMessage(tostring(GetActionTexture(slotnum)))
    end
    slotnum = slotnum + 1;
end
-- 1.2==然后填入动作栏编号 
-- 动作相关链接http://wow.battlenet.top/api/view/search_list?s=GetAction
-- 73动作栏1,1
-- 13动作栏2,1
-- 61动作栏左下,1
-- 49动作栏右下,1
-- 37动作栏侧内,1
-- 25动作栏侧外,1
o, t = IsActionInRange(73)
ChatFrame1:AddMessage(tostring(o))
ChatFrame1:AddMessage(tostring(t))

-- 2==返回您是否在范围内执行与指定单位的各种交互。
-- https://wowpedia.fandom.com/wiki/API_CheckInteractDistance
-- 1 = Compare Achievements 比较成就????, 28 yards
-- 2 = Trade 交易最大距离, 8 yards
-- 3 = Duel 决斗最大距离, 7 yards
-- 4 = Follow 跟随最大距离, 28 yards
-- 5 = ???, 7 yards
-- 距离插件 判断先后顺序 3-2-4是否为真以及其它
local arr = {28, 8, 7, 28, 00}
for i = 1, 5 do
    local inRange = CheckInteractDistance("target", i)
    ChatFrame1:AddMessage(i .. "==" .. arr[i] .. ">>>" .. tostring(inRange))
end
-- 3==获取指定动作按钮冷却状况。
-- 无冷却返回0 否则返回一串不同数字例如:79323.234
ChatFrame1:AddMessage(tostring(GetActionCooldown(62)))

-- 技能可立即执行时返回 1，其他情况返回 nil。
ChatFrame1:AddMessage(tostring(IsUsableAction(63)))

-- 友好
ChatFrame1:AddMessage(tostring(UnitIsFriend("party1", "party1target")))
-- 姓名
ChatFrame1:AddMessage(tostring(UnitName("party1target")))

