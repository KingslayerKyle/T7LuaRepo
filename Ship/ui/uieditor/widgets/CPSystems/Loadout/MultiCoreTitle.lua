-- c2a51f203f8d7c6696cee9fff5d02a80
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.Loadout.BlueCoreBacking" )

CoD.MultiCoreTitle = InheritFrom( LUI.UIElement )
CoD.MultiCoreTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MultiCoreTitle )
	self.id = "MultiCoreTitle"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 291 )
	self:setTopBottom( true, false, 0, 23 )
	self.anyChildUsesUpdateState = true
	
	local BlueCoreBacking = CoD.BlueCoreBacking.new( menu, controller )
	BlueCoreBacking:setLeftRight( true, false, 0, 291 )
	BlueCoreBacking:setTopBottom( true, false, 0, 23 )
	self:addElement( BlueCoreBacking )
	self.BlueCoreBacking = BlueCoreBacking
	
	local subheaderText = LUI.UITightText.new()
	subheaderText:setLeftRight( true, false, 6, 128 )
	subheaderText:setTopBottom( true, false, 0, 23 )
	subheaderText:setText( Engine.Localize( GetItemNameFromIndex( GetCybercoreItemIndex( controller, "Care Package" ) ) ) )
	subheaderText:setTTF( "fonts/escom.ttf" )

	LUI.OverrideFunction_CallOriginalFirst( subheaderText, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( subheaderText )
	self.subheaderText = subheaderText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Multicore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
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
		element.BlueCoreBacking:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
