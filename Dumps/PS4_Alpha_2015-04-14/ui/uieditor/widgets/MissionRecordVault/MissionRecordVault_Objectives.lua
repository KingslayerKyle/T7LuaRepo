CoD.MissionRecordVault_Objectives = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Objectives.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Objectives )
	self.id = "MissionRecordVault_Objectives"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 459 )
	self:setTopBottom( true, false, 0, 180 )
	
	local ObjectivesBackground = LUI.UIImage.new()
	ObjectivesBackground:setLeftRight( true, false, 0, 459 )
	ObjectivesBackground:setTopBottom( true, false, 0, 180 )
	ObjectivesBackground:setRGB( 0.36, 0.36, 0.36 )
	ObjectivesBackground:setAlpha( 0.5 )
	ObjectivesBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ObjectivesBackground )
	self.ObjectivesBackground = ObjectivesBackground
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 14, 459 )
	Description:setTopBottom( true, false, 50, 69 )
	Description:setRGB( 1, 1, 1 )
	Description:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "mapDescription", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Objective = LUI.UIText.new()
	Objective:setLeftRight( true, false, 14, 459 )
	Objective:setTopBottom( true, false, 14, 39 )
	Objective:setRGB( 1, 1, 1 )
	Objective:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	Objective:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Objective:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Objective:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "mapObjective", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Objective:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Objective )
	self.Objective = Objective
	
	self.close = function ( self )
		self.Description:close()
		self.Objective:close()
		CoD.MissionRecordVault_Objectives.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

