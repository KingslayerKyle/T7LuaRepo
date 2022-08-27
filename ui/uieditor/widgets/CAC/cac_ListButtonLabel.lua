-- a67717c1c4c2cded71ddcc7bb0477d74
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )
require( "ui.uieditor.widgets.CAC.NewBreadcrumb" )

CoD.cac_ListButtonLabel = InheritFrom( LUI.UIElement )
CoD.cac_ListButtonLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ListButtonLabel )
	self.id = "cac_ListButtonLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( true, true, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( true, true, 7, 0 )
	itemName:setTopBottom( false, true, LanguageOverrideNumber( "polish", -16.5, -19.5 ), LanguageOverrideNumber( "polish", -1.5, -0.5 ) )
	itemName:setRGB( 0.82, 0.85, 0.88 )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			itemName:setText( Engine.Localize( name ) )
		end
	end )
	itemName:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, controller )
		ScaleWidgetToLabelWrappedUp( self, element, 0, 0 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local newIcon = CoD.NewBreadcrumb.new( menu, controller )
	newIcon:setLeftRight( false, true, 3, 15 )
	newIcon:setTopBottom( false, false, -5, 7 )
	newIcon:setAlpha( 0 )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 0, 0 )
				self.Panel:setTopBottom( true, true, 0, 0 )
				self.Panel:setAlpha( 0.4 )
				self.clipFinished( Panel, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				newIcon:completeAnimation()
				self.newIcon:setAlpha( 0 )
				self.clipFinished( newIcon, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 0, 0 )
				self.Panel:setTopBottom( true, true, 0, 0 )
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				newIcon:completeAnimation()
				self.newIcon:setAlpha( 0 )
				self.clipFinished( newIcon, {} )
			end
		},
		HasNew = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 0, 15 )
				self.Panel:setTopBottom( true, true, 0, 0 )
				self.Panel:setAlpha( 0.4 )
				self.clipFinished( Panel, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				newIcon:completeAnimation()
				self.newIcon:setAlpha( 1 )
				self.clipFinished( newIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "HasNew",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.newIcon:close()
		element.itemName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

