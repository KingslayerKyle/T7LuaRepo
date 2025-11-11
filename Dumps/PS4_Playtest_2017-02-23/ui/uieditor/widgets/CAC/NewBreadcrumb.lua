CoD.NewBreadcrumb = InheritFrom( LUI.UIElement )
CoD.NewBreadcrumb.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NewBreadcrumb )
	self.id = "NewBreadcrumb"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 30 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local newBreadcrumb = LUI.UIImage.new()
	newBreadcrumb:setLeftRight( 0, 1, 0, 0 )
	newBreadcrumb:setTopBottom( 0, 1, 0, 0 )
	newBreadcrumb:setImage( RegisterImage( "uie_t7_menu_frontend_helptag" ) )
	self:addElement( newBreadcrumb )
	self.newBreadcrumb = newBreadcrumb
	
	self.resetProperties = function ()
		newBreadcrumb:completeAnimation()
		newBreadcrumb:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				newBreadcrumb:completeAnimation()
				self.newBreadcrumb:setAlpha( 0 )
				self.clipFinished( newBreadcrumb, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

