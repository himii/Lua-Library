function onUse(cid, item, fromPosition, itemEx, toPosition)
	local combat = createCombatObject()
		setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
		setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
		setConditionParam(condition, CONDITION_PARAM_TICKS, 120000)
		setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, 135)
		setConditionParam(condition, CONDITION_PARAM_BUFF, true)
		setCombatCondition(combat, condition)

	function onCastSpell(cid, var)
		return doCombat(cid, combat, var)
	end
end
