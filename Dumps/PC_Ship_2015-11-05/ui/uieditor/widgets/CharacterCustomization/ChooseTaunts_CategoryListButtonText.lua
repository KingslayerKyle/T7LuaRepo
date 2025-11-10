require( "ui.uieditor.widgets.CAC.NewBreadcrumb" )

CoD.ChooseTaunts_CategoryListButtonText = InheritFrom( LUI.UIElement )
CoD.ChooseTaunts_CategoryListButtonText.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 5
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseTaunts_CategoryListButtonText )
	self.id = "ChooseTaunts_CategoryListButtonText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 188 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 0, 169 )
	Title:setTopBottom( false, false, -11, 11 )
	Title:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Title:linkToElementModel( self, "categoryName", true, function ( model )
		local categoryName = Engine.GetModelValue( model )
		if categoryName then
			Title:setText( Engine.Localize( categoryName ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( Title, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( Title )
	self.Title = Title
	
	local newIcon = CoD.NewBreadcrumb.new( menu, controller )
	newIcon:setLeftRight( false, true, -14, -2 )
	newIcon:setTopBottom( false, false, -5, 7 )
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
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

