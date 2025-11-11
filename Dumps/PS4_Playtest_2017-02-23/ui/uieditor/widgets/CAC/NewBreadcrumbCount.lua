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
	self:setLeftRight( 0, 0, 0, 27 )
	self:setTopBottom( 0, 0, 0, 27 )
	self.anyChildUsesUpdateState = true
	
	local breadcrumb = CoD.NewBreadcrumb.new( menu, controller )
	breadcrumb:setLeftRight( 0.5, 0.5, -13.5, 13.5 )
	breadcrumb:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	self:addElement( breadcrumb )
	self.breadcrumb = breadcrumb
	
	local countText = LUI.UIText.new()
	countText:setLeftRight( 0, 0, 5, 27 )
	countText:setTopBottom( 0, 0, 2, 26 )
	countText:setRGB( 0, 0, 0 )
	countText:setText( Engine.Localize( "5" ) )
	countText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	countText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	countText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( countText )
	self.countText = countText
	
	self.resetProperties = function ()
		breadcrumb:completeAnimation()
		countText:completeAnimation()
		breadcrumb:setAlpha( 1 )
		countText:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.breadcrumb:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

