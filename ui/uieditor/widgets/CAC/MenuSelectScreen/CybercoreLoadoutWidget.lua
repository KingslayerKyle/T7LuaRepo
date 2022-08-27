-- ccd263d9b0972348ed7e497b326757cd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreMulticoreWidget" )
require( "ui.uieditor.widgets.CPSystems.Loadout.cyberCoreTiles" )
require( "ui.uieditor.widgets.CPSystems.Loadout.ChangeCybercoreLabel" )
require( "ui.uieditor.widgets.CPSystems.Loadout.MultiCoreTitle" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setHandleMouse( true )
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		CoD.PCUtil.SimulateButtonPress( f1_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.CybercoreLoadoutWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreLoadoutWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercoreLoadoutWidget )
	self.id = "CybercoreLoadoutWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 293 )
	self:setTopBottom( true, false, 0, 179 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, -2, 2 )
	background:setTopBottom( true, true, 25, 2 )
	background:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	background:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, false, 2, 258.5 )
	Backing:setTopBottom( true, false, 150, 173 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local cybercoreIcon = LUI.UIImage.new()
	cybercoreIcon:setLeftRight( false, false, -77, 77 )
	cybercoreIcon:setTopBottom( true, true, 25, 0 )
	cybercoreIcon:setScale( 0.8 )
	cybercoreIcon:setImage( RegisterImage( GetItemImageFromIndex( GetCybercoreItemIndex( controller, "uie_t7_hud_ks_carepackage_menu" ) ) ) )
	self:addElement( cybercoreIcon )
	self.cybercoreIcon = cybercoreIcon
	
	local CybercoreMulticoreWidget0 = CoD.CybercoreMulticoreWidget.new( menu, controller )
	CybercoreMulticoreWidget0:setLeftRight( true, false, 174, 293 )
	CybercoreMulticoreWidget0:setTopBottom( true, false, 25, 115 )
	CybercoreMulticoreWidget0:setAlpha( 0 )
	CybercoreMulticoreWidget0.icon:setImage( RegisterImage( GetItemImageFromIndex( GetEquippedCybercoreItemIndex( controller, "uie_t7_hud_ks_carepackage_menu" ) ) ) )
	CybercoreMulticoreWidget0:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsMulticoreActivated( controller )
			end
		}
	} )
	self:addElement( CybercoreMulticoreWidget0 )
	self.CybercoreMulticoreWidget0 = CybercoreMulticoreWidget0
	
	local multicoreInstruction = LUI.UIText.new()
	multicoreInstruction:setLeftRight( true, true, 3, -3 )
	multicoreInstruction:setTopBottom( true, false, 144.75, 160.75 )
	multicoreInstruction:setAlpha( 0 )
	multicoreInstruction:setText( Engine.Localize( "FEATURE_MULTICORE_DESC" ) )
	multicoreInstruction:setTTF( "fonts/default.ttf" )
	multicoreInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	multicoreInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( multicoreInstruction )
	self.multicoreInstruction = multicoreInstruction
	
	local cyberCoreTiles = CoD.cyberCoreTiles.new( menu, controller )
	cyberCoreTiles:setLeftRight( true, false, 0, 291 )
	cyberCoreTiles:setTopBottom( true, false, 0, 25 )
	self:addElement( cyberCoreTiles )
	self.cyberCoreTiles = cyberCoreTiles
	
	local ChangeCybercoreLabel = CoD.ChangeCybercoreLabel.new( menu, controller )
	ChangeCybercoreLabel:setLeftRight( true, false, 2, 258.5 )
	ChangeCybercoreLabel:setTopBottom( true, false, 157, 179 )
	self:addElement( ChangeCybercoreLabel )
	self.ChangeCybercoreLabel = ChangeCybercoreLabel
	
	local MultiCoreTitle = CoD.MultiCoreTitle.new( menu, controller )
	MultiCoreTitle:setLeftRight( true, false, 1, 291 )
	MultiCoreTitle:setTopBottom( true, false, 26, 49 )
	self:addElement( MultiCoreTitle )
	self.MultiCoreTitle = MultiCoreTitle
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -94, 134 )
	Glow2:setTopBottom( true, true, -35.21, 45.21 )
	Glow2:setRGB( 0.91, 1, 0 )
	Glow2:setAlpha( 0 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.clipFinished( background, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.clipFinished( background, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0.5 )
				self.clipFinished( Glow2, {} )
			end
		},
		Multicore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				multicoreInstruction:completeAnimation()
				self.multicoreInstruction:setAlpha( 1 )
				self.clipFinished( multicoreInstruction, {} )
				ChangeCybercoreLabel:completeAnimation()
				self.ChangeCybercoreLabel:setAlpha( 0 )
				self.clipFinished( ChangeCybercoreLabel, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 3 )
				multicoreInstruction:completeAnimation()
				self.multicoreInstruction:setAlpha( 1 )
				self.clipFinished( multicoreInstruction, {} )
				ChangeCybercoreLabel:completeAnimation()
				self.ChangeCybercoreLabel:setAlpha( 0 )
				self.clipFinished( ChangeCybercoreLabel, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0.5 )
				self.clipFinished( Glow2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Multicore",
			condition = function ( menu, element, event )
				return IsMulticoreActivated( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CybercoreMulticoreWidget0:close()
		element.cyberCoreTiles:close()
		element.ChangeCybercoreLabel:close()
		element.MultiCoreTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

