CoD.MissionRecordVault_Resistance = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Resistance.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Resistance )
	self.id = "MissionRecordVault_Resistance"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 442 )
	self:setTopBottom( true, false, 0, 235 )
	
	local ResistanceBackground = LUI.UIImage.new()
	ResistanceBackground:setLeftRight( true, true, 0, 0 )
	ResistanceBackground:setTopBottom( true, true, 0, 0 )
	ResistanceBackground:setRGB( 0.36, 0.36, 0.36 )
	ResistanceBackground:setAlpha( 0.5 )
	ResistanceBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ResistanceBackground )
	self.ResistanceBackground = ResistanceBackground
	
	local ResistanceTitle = LUI.UIText.new()
	ResistanceTitle:setLeftRight( false, true, -437, -53 )
	ResistanceTitle:setTopBottom( false, false, -109.5, -84.5 )
	ResistanceTitle:setRGB( 1, 1, 1 )
	ResistanceTitle:setText( Engine.Localize( "CPUI_EXPECTED_RESISTANCE_TITLE" ) )
	ResistanceTitle:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	ResistanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ResistanceTitle )
	self.ResistanceTitle = ResistanceTitle
	
	local ResistanceText = LUI.UIText.new()
	ResistanceText:setLeftRight( false, true, -437, -8 )
	ResistanceText:setTopBottom( false, false, -78.5, -62.5 )
	ResistanceText:setRGB( 1, 1, 1 )
	ResistanceText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ResistanceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ResistanceText:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "resistanceText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ResistanceText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ResistanceText )
	self.ResistanceText = ResistanceText
	
	self.close = function ( self )
		self.ResistanceText:close()
		CoD.MissionRecordVault_Resistance.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

