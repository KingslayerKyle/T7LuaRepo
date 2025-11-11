require( "ui.uieditor.widgets.CAC.NewBreadcrumb" )

CoD.ChooseTaunts_CategoryListButtonText = InheritFrom( LUI.UIElement )
CoD.ChooseTaunts_CategoryListButtonText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseTaunts_CategoryListButtonText )
	self.id = "ChooseTaunts_CategoryListButtonText"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 282 )
	self:setTopBottom( 0, 0, 0, 33 )
	self.anyChildUsesUpdateState = true
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( 0, 1, 0, -6 )
	Title:setTopBottom( 0, 0, 0, 33 )
	Title:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Title:linkToElementModel( self, "categoryName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( Title, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( Title )
	self.Title = Title
	
	local newIcon = CoD.NewBreadcrumb.new( menu, controller )
	newIcon:setLeftRight( 1, 1, 0, 18 )
	newIcon:setTopBottom( 0.5, 0.5, -7, 11 )
	newIcon:setAlpha( 0 )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	self.resetProperties = function ()
		newIcon:completeAnimation()
		newIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		BreadcrumbVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				newIcon:completeAnimation()
				self.newIcon:setAlpha( 1 )
				self.clipFinished( newIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.newIcon:close()
		self.Title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

