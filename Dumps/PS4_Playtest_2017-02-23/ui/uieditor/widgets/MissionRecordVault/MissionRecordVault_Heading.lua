require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )

CoD.MissionRecordVault_Heading = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Heading.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Heading )
	self.id = "MissionRecordVault_Heading"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( 0, 0, 0, 568 )
	self:setTopBottom( 0, 0, 0, 139 )
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( 0, 0, 24, 1072 )
	Title:setTopBottom( 0, 0, 20, 80 )
	Title:setText( LocalizeToUpperString( "FLYING LOTUS" ) )
	Title:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	Title:setShaderVector( 0, 0.02, 0, 0, 0 )
	Title:setShaderVector( 1, 0, 0, 0, 0 )
	Title:setShaderVector( 2, 0, 0, 0, 0 )
	Title:setShaderVector( 3, 0, 0, 0, 0 )
	Title:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Title )
	self.Title = Title
	
	local FETitleLineL = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineL:setLeftRight( 0, 1, 2, -46 )
	FETitleLineL:setTopBottom( 0.5, 0.5, 33, 39 )
	self:addElement( FETitleLineL )
	self.FETitleLineL = FETitleLineL
	
	local FETitleLineU = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineU:setLeftRight( 0, 1, 2, -46 )
	FETitleLineU:setTopBottom( 0.5, 0.5, -67, -61 )
	self:addElement( FETitleLineU )
	self.FETitleLineU = FETitleLineU
	
	local diaglrg = LUI.UIImage.new()
	diaglrg:setLeftRight( 0, 0, -120, 108 )
	diaglrg:setTopBottom( 0, 0, 33, 45 )
	diaglrg:setZRot( 45 )
	diaglrg:setImage( RegisterImage( "uie_t7_menu_frontend_titlebacklinediaga" ) )
	diaglrg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( diaglrg )
	self.diaglrg = diaglrg
	
	local diagsm = LUI.UIImage.new()
	diagsm:setLeftRight( 0, 0, 65, 119 )
	diagsm:setTopBottom( 0, 0, -27, -15 )
	diagsm:setZRot( 45 )
	diagsm:setImage( RegisterImage( "uie_t7_menu_frontend_titlebacklinediagb" ) )
	diagsm:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( diagsm )
	self.diagsm = diagsm
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleLineL:close()
		self.FETitleLineU:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

