-- 7fb7c8bfb3693101ca47493e2d1c992c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.NewBreadcrumb" )

CoD.NewBreadcrumbCount = InheritFrom( LUI.UIElement )
CoD.NewBreadcrumbCount.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.NewBreadcrumbCount )
	self.id = "NewBreadcrumbCount"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 18 )
	self:setTopBottom( true, false, 0, 18 )
	self.anyChildUsesUpdateState = true
	
	local breadcrumb = CoD.NewBreadcrumb.new( menu, controller )
	breadcrumb:setLeftRight( false, false, -9, 9 )
	breadcrumb:setTopBottom( false, false, -9, 9 )
	self:addElement( breadcrumb )
	self.breadcrumb = breadcrumb
	
	local countText = LUI.UIText.new()
	countText:setLeftRight( true, false, 3, 18 )
	countText:setTopBottom( true, false, 1, 17 )
	countText:setRGB( 0, 0, 0 )
	countText:setText( Engine.Localize( "5" ) )
	countText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	countText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	countText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( countText )
	self.countText = countText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				breadcrumb:completeAnimation()
				self.breadcrumb:setAlpha( 0 )
				self.clipFinished( breadcrumb, {} )

				countText:completeAnimation()
				self.countText:setAlpha( 0 )
				self.clipFinished( countText, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				breadcrumb:completeAnimation()
				self.breadcrumb:setAlpha( 1 )
				self.clipFinished( breadcrumb, {} )

				countText:completeAnimation()
				self.countText:setAlpha( 1 )
				self.clipFinished( countText, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.breadcrumb:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

