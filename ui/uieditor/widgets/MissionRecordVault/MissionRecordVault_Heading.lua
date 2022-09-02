-- bda2d85c09150b329cc6baf382112020
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 379 )
	self:setTopBottom( true, false, 0, 93 )
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 16, 715 )
	Title:setTopBottom( true, false, 13, 53 )
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
	FETitleLineL:setLeftRight( true, true, 1, -31 )
	FETitleLineL:setTopBottom( false, false, 22, 26 )
	self:addElement( FETitleLineL )
	self.FETitleLineL = FETitleLineL
	
	local FETitleLineU = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineU:setLeftRight( true, true, 1, -31 )
	FETitleLineU:setTopBottom( false, false, -45, -41 )
	self:addElement( FETitleLineU )
	self.FETitleLineU = FETitleLineU
	
	local diaglrg = LUI.UIImage.new()
	diaglrg:setLeftRight( true, false, -80, 72 )
	diaglrg:setTopBottom( true, false, 22, 30 )
	diaglrg:setZRot( 45 )
	diaglrg:setImage( RegisterImage( "uie_t7_menu_frontend_titlebacklinediaga" ) )
	diaglrg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( diaglrg )
	self.diaglrg = diaglrg
	
	local diagsm = LUI.UIImage.new()
	diagsm:setLeftRight( true, false, 43, 79 )
	diagsm:setTopBottom( true, false, -18, -10 )
	diagsm:setZRot( 45 )
	diagsm:setImage( RegisterImage( "uie_t7_menu_frontend_titlebacklinediagb" ) )
	diagsm:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( diagsm )
	self.diagsm = diagsm
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleLineL:close()
		element.FETitleLineU:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

