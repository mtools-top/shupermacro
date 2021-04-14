T, F = T or 0, F or CreateFrame("frame")
if X then
    X = nil
else
    X = function()
        local t = GetTime()
        if t - T > 1 and UnitAffectingCombat("player") == 1 then
            if UnitMana("player") >= 10 then
                if not IsBuffActive("战斗怒吼", "player") then
                    ChatFrame1:AddMessage("战斗怒吼");
                    CastSpellByName("战斗怒吼");
                else
                    if not IsBuffActive("撕裂", "target") then
                        ChatFrame1:AddMessage("撕裂");
                        CastSpellByName("撕裂");
                    end
                end
            elseif UnitMana("player") >= 30 then
                ChatFrame1:AddMessage("英勇打击");
                CastSpellByName("英勇打击");
            else
                ChatFrame1:AddMessage("怒气不足");
            end
            T = t
        end
    end
end
F:SetScript("OnUpdate", X)

T, F = T or 0, F or CreateFrame("frame")
if X then
    X = nil
else
    X = function()
        local t = GetTime()
        if t - T > 1 then
            if UnitAffectingCombat("player") == 1 then
                if UnitMana("player") >= 10 then
                    if not IsBuffActive("战斗怒吼", "player") then
                        ChatFrame1:AddMessage("战斗怒吼");
                        CastSpell(16, "spell");
                    else
                        if not IsBuffActive("撕裂", "target") then
                            ChatFrame1:AddMessage("撕裂");
                            CastSpell(12, "spell");
                        end
                    end
                elseif UnitMana("player") >= 30 then
                    ChatFrame1:AddMessage("英勇打击");
                    CastSpell(14, "spell");
                else
                    ChatFrame1:AddMessage("怒气不足");
                end
            end
            T = t
        end
    end
end
F:SetScript("OnUpdate", X)
