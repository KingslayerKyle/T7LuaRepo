LUI.DEV = {}
LUI.DEVHideButtonPrompts = false
LUI.DEV.HideButtonPrompts = function ( self, event )
	if event.show == true then
		LUI.DEVHideButtonPrompts = false
		if LUI.DEV.BackupButtonStrings ~= nil then
			for key, value in pairs( LUI.DEV.BackupButtonStrings ) do
				CoD.buttonStrings[key] = value
			end
			LUI.DEV.BackupButtonStrings = nil
		end
		if LUI.DEV.BackupDataSourceImages ~= nil then
			for key, value in pairs( LUI.DEV.BackupDataSourceImages ) do
				local model = Engine.GetModel( DataSources.Controller.Model, key )
				if model ~= nil then
					Engine.SetModelValue( model, value )
				end
			end
			LUI.DEV.BackupDataSourceImages = nil
		end
	else
		LUI.DEVHideButtonPrompts = true
		LUI.DEV.BackupButtonStrings = {}
		for key, value in pairs( CoD.buttonStrings ) do
			LUI.DEV.BackupButtonStrings[key] = value
			CoD.buttonStrings[key] = "  "
		end
		LUI.DEV.BackupDataSourceImages = {}
		local buttons = {
			"primary_button_image",
			"secondary_button_image",
			"alt1_button_image",
			"alt2_button_image",
			"back_button_image",
			"start_button_image",
			"left_shoulder_button_image",
			"right_shoulder_button_image",
			"left_stick_button_image",
			"right_stick_button_image",
			"left_trigger_button_image",
			"right_trigger_button_image",
			"dpad_lr_button_image",
			"dpad_up_button_image",
			"dpad_down_button_image"
		}
		for index, key in pairs( buttons ) do
			local model = Engine.GetModel( DataSources.Controller.Model, key )
			if model ~= nil then
				local modelValue = Engine.GetModelValue( model )
				if modelValue ~= nil then
					LUI.DEV.BackupDataSourceImages[key] = modelValue
					Engine.SetModelValue( model, "blacktransparent" )
				end
			end
		end
	end
end

LUI.DEV.DebugElementPath = function ( element, index )
	local fullname = "<no element>"
	local item = element
	while item do
		if item == element then
			fullname = item.id
		else
			fullname = item.id .. "." .. fullname
		end
		item = item:getParent()
	end
	local f2_local0
	if index ~= nil then
		f2_local0 = index .. ":\t"
		if not f2_local0 then
		
		else
			return f2_local0 .. fullname
		end
	end
	f2_local0 = ""
end

local f0_local0 = LUI.DEV
f0_local0.DebugPrintElement = function ( root, event )
	DebugPrint( LUI.DEV.DebugElementPath( event.element, event.index ) )
	return true
end

f0_local0 = function ( element, imageList, materialsList )
	local material = element:getMaterial()
	local image = element:getImage()
	if material then
		if materialsList[material] then
			materialsList[material] = materialsList[material] + 1
		else
			materialsList[material] = 1
		end
	end
	if image then
		if imageList[image] then
			imageList[image] = imageList[image] + 1
		else
			imageList[image] = 1
		end
	end
	local child = element:getFirstChild()
	while child ~= nil do
		f0_local0( child, imageList, materialsList )
		child = child:getNextSibling()
	end
end

LUI.DEV.DebugAllMaterials = function ( root )
	local imageList = {}
	local materialsList = {}
	f0_local0( root, imageList, materialsList )
	local alphabeticalPrint = function ( list )
		local keys = {}
		for k, v in pairs( list ) do
			table.insert( keys, k )
		end
		table.sort( keys )
		for _, v in ipairs( keys ) do
			DebugPrint( v .. " : " .. list[v] )
		end
	end
	
	DebugPrint( "==================================" )
	DebugPrint( "===          MATERIALS         ===" )
	DebugPrint( "==================================" )
	alphabeticalPrint( materialsList )
	DebugPrint( "=================================" )
	DebugPrint( "===           IMAGES          ===" )
	DebugPrint( "=================================" )
	alphabeticalPrint( imageList )
end

if LUI.primaryRoot ~= nil then
	LUI.primaryRoot:registerEventHandler( "hide_button_prompts", LUI.DEV.HideButtonPrompts )
	LUI.primaryRoot:registerEventHandler( "debug_print_element", LUI.DEV.DebugPrintElement )
	LUI.primaryRoot:registerEventHandler( "debug_materials_and_images", LUI.DEV.DebugAllMaterials )
end
LUI.DEV.ElementAssert = function ( element, message )
	local errorText = ""
	local AppendErrorLine = function ( newLine )
		errorText = errorText .. newLine .. "\n"
	end
	
	AppendErrorLine( "LUI Element Error: " .. message )
	AppendErrorLine( "Element Info:" )
	AppendErrorLine( "id_stack:" )
	local item = element
	while item do
		AppendErrorLine( "\t" .. item.id )
		item = item:getParent()
	end
	error( errorText )
end

