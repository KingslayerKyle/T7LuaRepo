-- b9b25343d7d2b304314022ec5fbd3fca
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.NewBreadcrumb" )

CoD.CategoryHeader = InheritFrom( LUI.UIElement )
CoD.CategoryHeader.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 3
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CategoryHeader )
	self.id = "CategoryHeader"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 68 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local header = LUI.UITightText.new()
	header:setLeftRight( true, false, 0, 50 )
	header:setTopBottom( false, false, -9, 9 )
	header:setRGB( 0.57, 0.59, 0.66 )
	header:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	header:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	header:setLetterSpacing( 0.5 )
	self:addElement( header )
	self.header = header
	
	local newIcon = CoD.NewBreadcrumb.new( menu, controller )
	newIcon:setLeftRight( true, false, 53, 65 )
	newIcon:setTopBottom( false, false, -6, 6 )
	newIcon:setAlpha( 0 )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				newIcon:completeAnimation()
				self.newIcon:setAlpha( 0 )
				self.clipFinished( newIcon, {} )
			end
		},
		BreadcrumbVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				newIcon:completeAnimation()
				self.newIcon:setAlpha( 1 )
				self.clipFinished( newIcon, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.newIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

