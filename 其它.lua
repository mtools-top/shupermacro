-- 1==参数：
-- “unit”：指定的单位，可使用：
--     "player"：玩家自身
--     "pet"：玩家自身的宠物
--     "party1"，"party2"，"party3"，"party4"：1至4号队友
--     "partypet1"~"partypet4"：1至4号队友的宠物
--     "raidN"：N（1~40）号团友
--     "raidpetN"：N（1~40）号团友的宠物
--     "target"：当前选中的目标，可以将"target"做为后缀直接添加在所有”unit”类型之后
-- 1.1==对象等级
ChatFrame1:AddMessage(tostring(UnitLevel("player")))
-- 1.2==对象职业
ChatFrame1:AddMessage(tostring(UnitClass("player")))
-- 1.3==对想是否为玩家,返回布尔值  转为字符串为 nil,1
ChatFrame1:AddMessage(tostring(UnitIsPlayer("target")))
-- 1.4==对象种族
ChatFrame1:AddMessage(tostring(UnitRace("target")))
-- 1.5==判断两个单位是否友好=
-- 中立:敌对:nil\\友好:1
ChatFrame1:AddMessage(tostring(UnitIsFriend("player", "target")))
-- 1.6==指定两个单位,判断两个单位的关系(例如:中立,友好,敌对)
-- 中立:4\\友好:5\\敌对:2
ChatFrame1:AddMessage(tostring(UnitReaction("player", "target")))
--返回指定单位的物种分类(例如:野兽)返回字符串
ChatFrame1:AddMessage(UnitCreatureType("target"))



-- 2==GetCVar:返回控制台变量的当前值。RealmName是服务器名称
ChatFrame1:AddMessage(tostring(GetCVar("RealmName")))

-- 3==获取天赋信息2,7表示天赋第二页第7个不算空的路径
-- a:代表返回天赋mingz
-- b:是天赋icon路径
-- c:行
-- d:列
-- e:当前加点
-- f:最大点数
-- g:一直是nil
-- h: 永远是1
local a, b, c, d, e, f, g, h = GetTalentInfo(2, 7);
if not g then
    g = "没有"
end
ChatFrame1:AddMessage(a .. "<||>" .. b .. "<|**************|>" .. c .. "<||>" .. d .. "<||>" .. e .. "<||>" .. f .."<||>" .. g .. "<||>" .. h)

-- 4==动作相关链接http://wow.battlenet.top/api/view/search_list?s=GetAction
-- 获取动作的文本标签（宏等），如果没有则返回nil。传入动作栏编号.如果返回值不为空则说明该动作是宏，不作为距离参考
ChatFrame1:AddMessage(tostring(GetActionText(1)))
-- 获取指定操作的纹理路径。
ChatFrame1:AddMessage(tostring(GetActionTexture(1)))
-- ----循环120次.看别人这样写的判断是不是宏
local slotnum = 1;
while (slotnum <= 120) do
    if GetActionText(slotnum) then
        ChatFrame1:AddMessage(slotnum)
        ChatFrame1:AddMessage(tostring(GetActionText(slotnum)))
        ChatFrame1:AddMessage(tostring(GetActionTexture(slotnum)))
    end
    slotnum = slotnum + 1;
end
-- 报错找不到GetActionInfo
local type,id,subtype = GetActionInfo(73) ChatFrame1:AddMessage("type:"..type.."=".."id:"..id.."=".."subtype:"..subtype.."=")

-- 5==如果第一个单位可以攻击第二个单位，则返回布尔,字符串为nil,1。
ChatFrame1:AddMessage(tostring(UnitCanAttack("player","target")))

ChatFrame1:AddMessage(tostring(UnitRace("target")))
ChatFrame1:AddMessage(tostring(UnitRace("target")))
ChatFrame1:AddMessage(tostring(UnitRace("target")))
