CoD.ColorUtility = {}
CoD.ColorUtility.ConsoleColors = {}
CoD.ColorUtility.GetColorFromFormattedColorString = function ( color )
	local components = CoD.GetNumValuesFromSpaceSeparatedString( color )
	if #components ~= 3 then
		return 
	end
	local multiplyFactor = 1
	for i = 1, #components, 1 do
		if components[i] > 1 then
			components[i] = components[i] * 0
		else
			components[i] = components[i] * 1
		end
	end
	local newColorSet = {
		r = components[1],
		g = components[2],
		b = components[3]
	}
	return newColorSet
end

CoD.ColorUtility.ExplodeColor = function ( color )
	if not color then
		color = {}
	end
	return color.r or 0, color.g or 0, color.b or 0
end

CoD.ColorUtility.UpdateColorSet = function ( name, color )
	if not ColorSet[name] then
		return 
	else
		local newColorSet = CoD.ColorUtility.GetColorFromFormattedColorString( color )
		ColorSet[name] = newColorSet
		Engine.UpdateColorSet( name, newColorSet )
	end
end

CoD.ColorUtility.GetColorBlindSafeColorForSetting = function ( baseColor, colorBlindSetting )
	local newColor = baseColor
	if colorBlindSetting == Enum.ColorVisionDeficiencies.CVD_DEUTERANOMALY then
		newColor = newColor .. "_Deuteranopia"
	elseif colorBlindSetting == Enum.ColorVisionDeficiencies.CVD_PROTANOMALY then
		newColor = newColor .. "_Protanopia"
	elseif colorBlindSetting == Enum.ColorVisionDeficiencies.CVD_TRITANOMALY then
		newColor = newColor .. "_Tritanopia"
	end
	local f4_local0 = ColorSet[newColor]
	if not f4_local0 then
		f4_local0 = ColorSet[baseColor]
	end
	return f4_local0
end

CoD.ColorUtility.GetColorBlindColorForPlayer = function ( controller, baseColor )
	local colorBlindSetting = Enum.ColorVisionDeficiencies.CVD_OFF
	local profile = Engine.GetPlayerCommonGamerProfile( controller )
	if profile ~= nil and profile.colorBlindMode ~= nil then
		colorBlindSetting = profile.colorBlindMode:get()
	end
	return CoD.ColorUtility.GetColorBlindSafeColorForSetting( baseColor, colorBlindSetting )
end

CoD.ColorUtility.NormalizeColor = function ( colorValue )
	local normalizedColor = {}
	local i = 1
	for token in string.gmatch( colorValue, "[^%s]+" ) do
		normalizedColor[i] = tonumber( token ) / CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE
		i = i + 1
	end
	return normalizedColor
end

CoD.ColorUtility.ConvertColor = function ( red, green, blue )
	return string.format( "%d %d %d", red * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE, green * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE, blue * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
end

CoD.ColorUtility.ClampColor = function ( color, min, max )
	if max < color then
		color = max
	elseif color < min then
		color = min
	end
	return color
end

CoD.ColorUtility.LerpColor = function ( rgbFrom, rgbTo, frac )
	frac = math.min( math.max( 0, frac ), 1 )
	local newColor = {
		r = rgbFrom.r * (1 - frac) + rgbTo.r * frac,
		g = rgbFrom.g * (1 - frac) + rgbTo.g * frac,
		b = rgbFrom.b * (1 - frac) + rgbTo.b * frac
	}
	return newColor
end

