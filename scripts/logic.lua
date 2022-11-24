function has(item, amount)
	local count = Tracker:ProviderCountForCode(item)
	amount = tonumber(amount)
	if not amount then
		return count > 0
	else
		return count >= amount
	end
end

function count(item)
	return Tracker:ProviderCountForCode(item)
end

function hard()
	return Tracker.ActiveVariantUID:find("hard")
end

function morph()
	return has("morph")
end

function bombs()
	return has("bombs")
end

function varia()
	return has("varia")
end

function gravity()
	return (has("gravity") and (unk() or ruins()))
end

function long()
	return has("long")
end

function charge()
	return has("charge")
end

function ice()
	return has("ice")
end

function wave()
	return has("wave")
end

function plasma()
	return (has("plasma") and (unk() or ruins()))
end

function grip()
	return has("grip")
end

function jump()
	return has("hi")
end

function speed()
	return has("speed")
end

function screw()
	return has("screw")
end

function space()
	return (has("space") and (unk() or ruins()))
end

function unk()
	return has("unk")
end

function ruins()
	return has("ruins")
end

function etank()
	return count("etank") 
end

function missile()
	return count("missile")
end

function super()
	return count("super")
end

function pb()
	return count("pb")
end

function energy(x)
	local x = tonumber(x)
	if hard() then
		return (((etank() + 2) * 50) > x)
	end
	return (((etank() + 1) * 100) > x)
end

function any(x)
	local x = tonumber(x)
	return ((missile() + super()) >= x)
end

function missiles(x)
	local x = tonumber(x)
	return (missile() >= x)
end

function supers(x)
	local x = tonumber(x)
	return (super() >= x)
end

function powers(x)
	local x = tonumber(x)
	return (pb() >= x)
end


function iwj()
	return has("walljump")
end

function ibj()
	return (has("ibj") and morph() and bombs())
end

function bombchain()
	return (morph() and (bombs() or powers(1)))
end

function bombblock()
	return (bombchain() or screw())
end

function launcher()
	return (morph() and bombs())
end

function ballspark()
	return (morph() and speed() and jump())
end

function heatimmune()
	return (varia() or gravity())
end

function canfreeze()
	return ice()
end

function ridley()
	return ( (norshaft() and (iwj() or grip() or ibj() or space()) and ceilingtunnel_8p())
		or (norheatrun() and speed() and ceilingtunnel_3_4() and (bombs() or powers(1) or plasma())) )
end

function norshaft()
	return (bombchain() and (ledgeNW_5() or speed()))
end

function norheatrun()
	return ((heatimmune() or energy(200)) and (speed() or ledgeNW_8p()))
end

function cholavarun()
	return ((gravity() or (varia() and energy(200)) or energy(300)) and ledge_8p())
end

function fullypowered()
	return ((ice() or has("icereq")) and cholavarun())
end

function ledge_4_5()
	return (jump() or grip() or iwj() or ibj() or space())
end

function ledgeNW_5()
	return (jump() or grip() or ibj() or space())
end

function ledge_6_7()
	return ((jump() and grip()) or iwj() or ibj() or space())
end

function ledgeNW_6_7()
	return ((jump() and grip()) or ibj() or space())
end

function ledge_8p()
	return (iwj() or ibj() or space())
end

function ledgeNW_8p()
	return (ibj() or space())
end

function ceilingtunnel_1_2()
	return (morph() and (bombs() or jump()))
end

function ceilingtunnel_3_4()
	return ((morph() and (grip() or jump())) or ibj())
end

function ceilingtunnel_5()
	return ((morph() and grip()) or ibj())
end

function ceilingtunnel_6_7()
	return ((morph() and grip() and (jump() or space() or iwj())) or ibj())
end

function ceilingtunnelNW_6_7()
	return ((morph() and grip() and (jump() or space())) or ibj())
end

function ceilingtunnel_8p()
	return ((morph() and grip() and (space() or iwj())) or ibj())
end

function ceilingtunnelNW_8p()
	return ((morph() and grip() and space()) or ibj())
end

function tunnel_1_3()
	return morph()
end

function tunnel_4_5()
	return ((morph() and (grip() or jump() or space() or iwj())) or ibj())
end

function tunnelNW_4_5()
	return ((morph() and (grip() or jump() or space())) or ibj())
end

function tunnel_6_7()
	return ((morph() and ((grip() and jump()) or space() or iwj())) or ibj())
end

function tunnelNW_6_7()
	return ((morph() and ((grip() and jump()) or space())) or ibj())
end

function tunnel_8p()
	return ((morph() and (space() or iwj())) or ibj())
end

function tunnelNW_8p()
	return ((morph() and space()) or ibj())
end