-- 7e0732b9b901e8245b407fbaf59fddd6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CPSystems.Loadout.LoadoutCoreTiles" )

CoD.CybercoreListItemWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreListItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercoreListItemWidget )
	self.id = "CybercoreListItemWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 310 )
	self:setTopBottom( true, false, 0, 114 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	background:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, false, -57, 55 )
	icon:setTopBottom( false, false, -57, 55 )
	self:addElement( icon )
	self.icon = icon
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( true, false, 288.5, 304.5 )
	equippedIcon:setTopBottom( true, false, 4, 20 )
	equippedIcon:setRGB( 0.55, 0.77, 0.25 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	local FEFocusBarContainerT = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarContainerT:setLeftRight( true, true, 2, -2 )
	FEFocusBarContainerT:setTopBottom( true, false, 0, 8 )
	FEFocusBarContainerT:setAlpha( 0 )
	self:addElement( FEFocusBarContainerT )
	self.FEFocusBarContainerT = FEFocusBarContainerT
	
	local FEFocusBarContainerB = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarContainerB:setLeftRight( true, true, 2, -2 )
	FEFocusBarContainerB:setTopBottom( false, true, -8, -1 )
	FEFocusBarContainerB:setAlpha( 0 )
	self:addElement( FEFocusBarContainerB )
	self.FEFocusBarContainerB = FEFocusBarContainerB
	
	local LoadoutCoreTiles = CoD.LoadoutCoreTiles.new( menu, controller )
	LoadoutCoreTiles:setLeftRight( true, false, 12, 210 )
	LoadoutCoreTiles:setTopBottom( true, false, 81.5, 103.5 )
	self:addElement( LoadoutCoreTiles )
	self.LoadoutCoreTiles = LoadoutCoreTiles
	
	self.icon:linkToElementModel( self, "icon", true, function ( model )
		local _icon = Engine.GetModelValue( model )
		if _icon then
			icon:setImage( RegisterImage( _icon ) )
		end
	end )
	self.LoadoutCoreTiles:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			LoadoutCoreTiles.itemName:setText( Engine.Localize( LocalizeIntoString( "CPUI_VAL1_CORE", name ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				FEFocusBarContainerT:completeAnimation()
				self.FEFocusBarContainerT:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerT, {} )
				FEFocusBarContainerB:completeAnimation()
				self.FEFocusBarContainerB:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				FEFocusBarContainerT:completeAnimation()
				self.FEFocusBarContainerT:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerT, {} )
				FEFocusBarContainerB:completeAnimation()
				self.FEFocusBarContainerB:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerB, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
				FEFocusBarContainerT:completeAnimation()
				self.FEFocusBarContainerT:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerT, {} )
				FEFocusBarContainerB:completeAnimation()
				self.FEFocusBarContainerB:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
				FEFocusBarContainerT:completeAnimation()
				self.FEFocusBarContainerT:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerT, {} )
				FEFocusBarContainerB:completeAnimation()
				self.FEFocusBarContainerB:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerB, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCybercoreItemEquipped( menu, element, controller )
			end
		}
	} )
	LoadoutCoreTiles.id = "LoadoutCoreTiles"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.LoadoutCoreTiles:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEFocusBarContainerT:close()
		element.FEFocusBarContainerB:close()
		element.LoadoutCoreTiles:close()
		element.icon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

