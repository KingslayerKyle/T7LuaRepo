-- 98b9befdb55a1981a69c3c63269dcfac
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_CybercoreMainTile" )
require( "ui.uieditor.widgets.CAC.cac_CybercoreDescription" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Texture" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_IconHex" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreSelectionAbilityWidget" )
require( "ui.uieditor.widgets.Safehouse.LoadoutsAbilityWheel" )

CoD.CybercoreSelectionInfoWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreSelectionInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CybercoreSelectionInfoWidget )
	self.id = "CybercoreSelectionInfoWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 780 )
	self:setTopBottom( true, false, 0, 586 )
	self.anyChildUsesUpdateState = true
	
	local cacCybercoreMainTile0 = CoD.cac_CybercoreMainTile.new( menu, controller )
	cacCybercoreMainTile0:setLeftRight( true, false, 0, 300 )
	cacCybercoreMainTile0:setTopBottom( true, false, 48, 84 )
	cacCybercoreMainTile0:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			cacCybercoreMainTile0.name:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( cacCybercoreMainTile0 )
	self.cacCybercoreMainTile0 = cacCybercoreMainTile0
	
	local cacCybercoreDescription0 = CoD.cac_CybercoreDescription.new( menu, controller )
	cacCybercoreDescription0:setLeftRight( true, false, 0, 432 )
	cacCybercoreDescription0:setTopBottom( true, false, 100.5, 125.5 )
	cacCybercoreDescription0:linkToElementModel( self, "desc", true, function ( model )
		local desc = Engine.GetModelValue( model )
		if desc then
			cacCybercoreDescription0.description:setText( Engine.Localize( desc ) )
		end
	end )
	self:addElement( cacCybercoreDescription0 )
	self.cacCybercoreDescription0 = cacCybercoreDescription0
	
	local Texture = CoD.AbilityWheel_Texture.new( menu, controller )
	Texture:setLeftRight( true, false, 0, 780 )
	Texture:setTopBottom( true, false, 65, 586 )
	self:addElement( Texture )
	self.Texture = Texture
	
	local cybercoreIcon = LUI.UIImage.new()
	cybercoreIcon:setLeftRight( false, false, 15.25, 204.75 )
	cybercoreIcon:setTopBottom( false, false, -63.5, 126 )
	cybercoreIcon:setScale( 0.9 )
	cybercoreIcon:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			cybercoreIcon:setImage( RegisterImage( icon ) )
		end
	end )
	self:addElement( cybercoreIcon )
	self.cybercoreIcon = cybercoreIcon
	
	local AbilityWheelIconHex2 = CoD.AbilityWheel_IconHex.new( menu, controller )
	AbilityWheelIconHex2:setLeftRight( false, false, -89.75, 0.5 )
	AbilityWheelIconHex2:setTopBottom( false, false, -111.71, -6 )
	AbilityWheelIconHex2:setAlpha( 0 )
	AbilityWheelIconHex2:setZRot( -300 )
	AbilityWheelIconHex2:setScale( 0.9 )
	AbilityWheelIconHex2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilityWheelIconHex2 )
	self.AbilityWheelIconHex2 = AbilityWheelIconHex2
	
	local CybercoreSelectionAbilityWidget2 = CoD.CybercoreSelectionAbilityWidget.new( menu, controller )
	CybercoreSelectionAbilityWidget2:setLeftRight( false, false, -83.5, -1.5 )
	CybercoreSelectionAbilityWidget2:setTopBottom( false, false, -107, -12 )
	CybercoreSelectionAbilityWidget2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CybercoreSelectionAbilityWidget2:linkToElementModel( self, "AbilityWheelWeapon2", false, function ( model )
		CybercoreSelectionAbilityWidget2:setModel( model, controller )
	end )
	self:addElement( CybercoreSelectionAbilityWidget2 )
	self.CybercoreSelectionAbilityWidget2 = CybercoreSelectionAbilityWidget2
	
	local AbilityWheelIconHex3 = CoD.AbilityWheel_IconHex.new( menu, controller )
	AbilityWheelIconHex3:setLeftRight( false, false, -89.5, 0.75 )
	AbilityWheelIconHex3:setTopBottom( false, false, 77.14, 182.86 )
	AbilityWheelIconHex3:setAlpha( 0 )
	AbilityWheelIconHex3:setZRot( -229 )
	AbilityWheelIconHex3:setScale( 0.9 )
	AbilityWheelIconHex3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilityWheelIconHex3 )
	self.AbilityWheelIconHex3 = AbilityWheelIconHex3
	
	local CybercoreSelectionAbilityWidget3 = CoD.CybercoreSelectionAbilityWidget.new( menu, controller )
	CybercoreSelectionAbilityWidget3:setLeftRight( false, false, -85.5, -3.5 )
	CybercoreSelectionAbilityWidget3:setTopBottom( false, false, 80.5, 175.5 )
	CybercoreSelectionAbilityWidget3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CybercoreSelectionAbilityWidget3:linkToElementModel( self, "AbilityWheelWeapon3", false, function ( model )
		CybercoreSelectionAbilityWidget3:setModel( model, controller )
	end )
	self:addElement( CybercoreSelectionAbilityWidget3 )
	self.CybercoreSelectionAbilityWidget3 = CybercoreSelectionAbilityWidget3
	
	local AbilityWheelIconHex4 = CoD.AbilityWheel_IconHex.new( menu, controller )
	AbilityWheelIconHex4:setLeftRight( false, false, 63.88, 154.12 )
	AbilityWheelIconHex4:setTopBottom( false, false, 155.5, 258.21 )
	AbilityWheelIconHex4:setAlpha( 0 )
	AbilityWheelIconHex4:setZRot( -180 )
	AbilityWheelIconHex4:setScale( 0.9 )
	AbilityWheelIconHex4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilityWheelIconHex4 )
	self.AbilityWheelIconHex4 = AbilityWheelIconHex4
	
	local CybercoreSelectionAbilityWidget4 = CoD.CybercoreSelectionAbilityWidget.new( menu, controller )
	CybercoreSelectionAbilityWidget4:setLeftRight( false, false, 68, 150 )
	CybercoreSelectionAbilityWidget4:setTopBottom( false, false, 155.5, 250.5 )
	CybercoreSelectionAbilityWidget4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CybercoreSelectionAbilityWidget4:linkToElementModel( self, "AbilityWheelWeapon4", false, function ( model )
		CybercoreSelectionAbilityWidget4:setModel( model, controller )
	end )
	self:addElement( CybercoreSelectionAbilityWidget4 )
	self.CybercoreSelectionAbilityWidget4 = CybercoreSelectionAbilityWidget4
	
	local AbilityWheelIconHex5 = CoD.AbilityWheel_IconHex.new( menu, controller )
	AbilityWheelIconHex5:setLeftRight( false, false, 211.25, 301.5 )
	AbilityWheelIconHex5:setTopBottom( false, false, 70, 175.71 )
	AbilityWheelIconHex5:setAlpha( 0 )
	AbilityWheelIconHex5:setZRot( -130 )
	AbilityWheelIconHex5:setScale( 0.9 )
	AbilityWheelIconHex5:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilityWheelIconHex5 )
	self.AbilityWheelIconHex5 = AbilityWheelIconHex5
	
	local CybercoreSelectionAbilityWidget5 = CoD.CybercoreSelectionAbilityWidget.new( menu, controller )
	CybercoreSelectionAbilityWidget5:setLeftRight( false, false, 214.5, 296.5 )
	CybercoreSelectionAbilityWidget5:setTopBottom( false, false, 70.5, 165.5 )
	CybercoreSelectionAbilityWidget5:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CybercoreSelectionAbilityWidget5:linkToElementModel( self, "AbilityWheelWeapon5", false, function ( model )
		CybercoreSelectionAbilityWidget5:setModel( model, controller )
	end )
	self:addElement( CybercoreSelectionAbilityWidget5 )
	self.CybercoreSelectionAbilityWidget5 = CybercoreSelectionAbilityWidget5
	
	local AbilityWheelIconHex6 = CoD.AbilityWheel_IconHex.new( menu, controller )
	AbilityWheelIconHex6:setLeftRight( false, false, 213.5, 303.75 )
	AbilityWheelIconHex6:setTopBottom( false, false, -112.28, -6.57 )
	AbilityWheelIconHex6:setAlpha( 0 )
	AbilityWheelIconHex6:setZRot( -58 )
	AbilityWheelIconHex6:setScale( 0.9 )
	AbilityWheelIconHex6:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilityWheelIconHex6 )
	self.AbilityWheelIconHex6 = AbilityWheelIconHex6
	
	local CybercoreSelectionAbilityWidget6 = CoD.CybercoreSelectionAbilityWidget.new( menu, controller )
	CybercoreSelectionAbilityWidget6:setLeftRight( false, false, 216.5, 298.5 )
	CybercoreSelectionAbilityWidget6:setTopBottom( false, false, -106, -11 )
	CybercoreSelectionAbilityWidget6:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CybercoreSelectionAbilityWidget6:linkToElementModel( self, "AbilityWheelWeapon6", false, function ( model )
		CybercoreSelectionAbilityWidget6:setModel( model, controller )
	end )
	self:addElement( CybercoreSelectionAbilityWidget6 )
	self.CybercoreSelectionAbilityWidget6 = CybercoreSelectionAbilityWidget6
	
	local CybercoreSelectionAbilityWidget1 = CoD.CybercoreSelectionAbilityWidget.new( menu, controller )
	CybercoreSelectionAbilityWidget1:setLeftRight( false, false, 69, 151 )
	CybercoreSelectionAbilityWidget1:setTopBottom( false, false, -185.71, -90.71 )
	CybercoreSelectionAbilityWidget1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CybercoreSelectionAbilityWidget1:linkToElementModel( self, "AbilityWheelWeapon1", false, function ( model )
		CybercoreSelectionAbilityWidget1:setModel( model, controller )
	end )
	self:addElement( CybercoreSelectionAbilityWidget1 )
	self.CybercoreSelectionAbilityWidget1 = CybercoreSelectionAbilityWidget1
	
	local AbilityWheelIconHex7 = CoD.AbilityWheel_IconHex.new( menu, controller )
	AbilityWheelIconHex7:setLeftRight( false, false, -264.5, -174.25 )
	AbilityWheelIconHex7:setTopBottom( false, false, -22.42, 83.29 )
	AbilityWheelIconHex7:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilityWheelIconHex7 )
	self.AbilityWheelIconHex7 = AbilityWheelIconHex7
	
	local CybercoreSelectionContextualAbilityWidget = CoD.CybercoreSelectionAbilityWidget.new( menu, controller )
	CybercoreSelectionContextualAbilityWidget:setLeftRight( false, false, -261.5, -179.5 )
	CybercoreSelectionContextualAbilityWidget:setTopBottom( false, false, -15.86, 79.14 )
	CybercoreSelectionContextualAbilityWidget:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CybercoreSelectionContextualAbilityWidget:linkToElementModel( self, "AbilityWheelContextualWeapon1", false, function ( model )
		CybercoreSelectionContextualAbilityWidget:setModel( model, controller )
	end )
	self:addElement( CybercoreSelectionContextualAbilityWidget )
	self.CybercoreSelectionContextualAbilityWidget = CybercoreSelectionContextualAbilityWidget
	
	local Hectagone = LUI.UIImage.new()
	Hectagone:setLeftRight( false, false, -18, 238 )
	Hectagone:setTopBottom( false, false, -97.71, 158.29 )
	Hectagone:setAlpha( 0 )
	Hectagone:setImage( RegisterImage( "uie_t7_mp_icon_loadout_center" ) )
	self:addElement( Hectagone )
	self.Hectagone = Hectagone
	
	local OuterCircle = LUI.UIImage.new()
	OuterCircle:setLeftRight( false, false, -123.88, 348.71 )
	OuterCircle:setTopBottom( false, false, -208.21, 264.38 )
	OuterCircle:setAlpha( 0.65 )
	OuterCircle:setScale( 0.9 )
	OuterCircle:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradcenter" ) )
	OuterCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OuterCircle )
	self.OuterCircle = OuterCircle
	
	local CenterCircle = LUI.UIImage.new()
	CenterCircle:setLeftRight( false, false, -34.38, 246.38 )
	CenterCircle:setTopBottom( false, false, -107.56, 173.19 )
	CenterCircle:setAlpha( 0.65 )
	CenterCircle:setScale( 0.9 )
	CenterCircle:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradcenter" ) )
	CenterCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterCircle )
	self.CenterCircle = CenterCircle
	
	local LoadoutsAbilityWheel1 = CoD.LoadoutsAbilityWheel.new( menu, controller )
	LoadoutsAbilityWheel1:setLeftRight( false, false, 62.38, 152.62 )
	LoadoutsAbilityWheel1:setTopBottom( false, false, -196.21, -90.5 )
	self:addElement( LoadoutsAbilityWheel1 )
	self.LoadoutsAbilityWheel1 = LoadoutsAbilityWheel1
	
	local LoadoutsAbilityWheel2 = CoD.LoadoutsAbilityWheel.new( menu, controller )
	LoadoutsAbilityWheel2:setLeftRight( false, false, -90.25, 0 )
	LoadoutsAbilityWheel2:setTopBottom( false, false, -112.36, -6.64 )
	LoadoutsAbilityWheel2:setZRot( -300 )
	self:addElement( LoadoutsAbilityWheel2 )
	self.LoadoutsAbilityWheel2 = LoadoutsAbilityWheel2
	
	local LoadoutsAbilityWheel3 = CoD.LoadoutsAbilityWheel.new( menu, controller )
	LoadoutsAbilityWheel3:setLeftRight( false, false, -89.75, 0.5 )
	LoadoutsAbilityWheel3:setTopBottom( false, false, 77.14, 182.86 )
	LoadoutsAbilityWheel3:setZRot( -230 )
	self:addElement( LoadoutsAbilityWheel3 )
	self.LoadoutsAbilityWheel3 = LoadoutsAbilityWheel3
	
	local LoadoutsAbilityWheel4 = CoD.LoadoutsAbilityWheel.new( menu, controller )
	LoadoutsAbilityWheel4:setLeftRight( false, false, 63.88, 154.12 )
	LoadoutsAbilityWheel4:setTopBottom( false, false, 155, 260.71 )
	LoadoutsAbilityWheel4:setZRot( -180 )
	self:addElement( LoadoutsAbilityWheel4 )
	self.LoadoutsAbilityWheel4 = LoadoutsAbilityWheel4
	
	local LoadoutsAbilityWheel5 = CoD.LoadoutsAbilityWheel.new( menu, controller )
	LoadoutsAbilityWheel5:setLeftRight( false, false, 210.25, 300.5 )
	LoadoutsAbilityWheel5:setTopBottom( false, false, 70.14, 175.86 )
	LoadoutsAbilityWheel5:setZRot( -130 )
	self:addElement( LoadoutsAbilityWheel5 )
	self.LoadoutsAbilityWheel5 = LoadoutsAbilityWheel5
	
	local LoadoutsAbilityWheel6 = CoD.LoadoutsAbilityWheel.new( menu, controller )
	LoadoutsAbilityWheel6:setLeftRight( false, false, 213.5, 303.75 )
	LoadoutsAbilityWheel6:setTopBottom( false, false, -111.36, -5.64 )
	LoadoutsAbilityWheel6:setZRot( -60 )
	self:addElement( LoadoutsAbilityWheel6 )
	self.LoadoutsAbilityWheel6 = LoadoutsAbilityWheel6
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacCybercoreMainTile0:close()
		element.cacCybercoreDescription0:close()
		element.Texture:close()
		element.AbilityWheelIconHex2:close()
		element.CybercoreSelectionAbilityWidget2:close()
		element.AbilityWheelIconHex3:close()
		element.CybercoreSelectionAbilityWidget3:close()
		element.AbilityWheelIconHex4:close()
		element.CybercoreSelectionAbilityWidget4:close()
		element.AbilityWheelIconHex5:close()
		element.CybercoreSelectionAbilityWidget5:close()
		element.AbilityWheelIconHex6:close()
		element.CybercoreSelectionAbilityWidget6:close()
		element.CybercoreSelectionAbilityWidget1:close()
		element.AbilityWheelIconHex7:close()
		element.CybercoreSelectionContextualAbilityWidget:close()
		element.LoadoutsAbilityWheel1:close()
		element.LoadoutsAbilityWheel2:close()
		element.LoadoutsAbilityWheel3:close()
		element.LoadoutsAbilityWheel4:close()
		element.LoadoutsAbilityWheel5:close()
		element.LoadoutsAbilityWheel6:close()
		element.cybercoreIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

