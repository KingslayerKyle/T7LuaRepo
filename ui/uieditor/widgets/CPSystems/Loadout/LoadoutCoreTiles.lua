-- a2fe8abb35757610651e2da1cc077802
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.LoadoutCoreTiles = InheritFrom( LUI.UIElement )
CoD.LoadoutCoreTiles.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadoutCoreTiles )
	self.id = "LoadoutCoreTiles"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 208 )
	self:setTopBottom( true, false, 0, 22 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( true, true, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( true, true, 0, 0 )
	CACvarientTitlePanel0:setAlpha( 0.4 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local itemName = LUI.UITightText.new()
	itemName:setLeftRight( true, false, 4, 208 )
	itemName:setTopBottom( false, true, -22, 0 )
	itemName:setTTF( "fonts/default.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	self.itemName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			itemName:setText( Engine.Localize( LocalizeIntoString( "CPUI_VAL1_CORE", name ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CACvarientTitlePanel0:close()
		element.itemName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

